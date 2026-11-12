#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Hardware Profile & Matrix Validator
# ==============================================================================
# Verifies that generated hardware JSON profiles for all supported target
# flavors conform to architectural requirements, driver specs, and audio buffers.
#
# Supported Flavors:
#   • bobzzite        : Desktop AMD / Intel Arc
#   • bobzzite-deck   : Handheld PCs (Steam Deck, Ally, Legion Go)
#   • bobzzite-nvidia : GeForce Workstations & Laptops
#
# Usage:
#   bobzzite-profile-validate [all|bobzzite|bobzzite-deck|bobzzite-nvidia]
# ==============================================================================

set -euo pipefail

TARGET="${1:-all}"
PROFILE_DIR="${PROFILE_DIR:-hardware_profiles}"
[ -d "$PROFILE_DIR" ] || PROFILE_DIR="/tmp/bobzzite-flavors"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite Hardware Profile Validator ===${NC}"

validate_flavor_profile() {
    local flavor="$1"
    local json_file="${PROFILE_DIR}/${flavor}.json"
    if [ ! -f "$json_file" ]; then
        json_file="${PROFILE_DIR}/${flavor}-profile.json"
    fi

    echo -e "${YELLOW}>>> Validating Hardware Profile: ${BOLD}${flavor}${NC}"

    # Ensure profile exists, generate if absent
    if [ ! -f "$json_file" ]; then
        echo -e "  • Profile JSON absent. Generating via flavor build engine..."
        if command -v bobzzite-build-flavors >/dev/null 2>&1; then
            bobzzite-build-flavors "$flavor" export-profile >/dev/null 2>&1
        elif [ -f "scripts/build-flavors.sh" ]; then
            bash scripts/build-flavors.sh "$flavor" export-profile >/dev/null 2>&1
        else
            echo -e "  ${RED}Error: Build flavors tool not found.${NC}"
            return 1
        fi
        if [ -f "/tmp/bobzzite-flavors/${flavor}-profile.json" ]; then
            json_file="/tmp/bobzzite-flavors/${flavor}-profile.json"
        fi
    fi

    if [ ! -f "$json_file" ]; then
        echo -e "  ${RED}Error: Failed to locate ${json_file}${NC}"
        return 1
    fi

    local errors=0

    # Validate required JSON keys
    for key in "flavor" "version" "base_image" "compositor" "hardware_target" "driver_stack" "video_encoders" "audio_quantum_default"; do
        if grep -q "\"$key\":" "$json_file"; then
            echo -e "  • Key ${CYAN}${key}${NC}: ${GREEN}Present${NC}"
        else
            echo -e "  • Key ${CYAN}${key}${NC}: ${RED}Missing${NC}"
            errors=$((errors + 1))
        fi
    done

    # Validate flavor-specific assertions
    case "$flavor" in
        bobzzite-deck)
            if grep -q '"compositor": "gamescope"' "$json_file"; then
                echo -e "  • Assertion (compositor=gamescope): ${GREEN}PASS${NC}"
            else
                echo -e "  • Assertion (compositor=gamescope): ${RED}FAIL${NC}"
                errors=$((errors + 1))
            fi
            if grep -q '"audio_quantum_default": 256' "$json_file"; then
                echo -e "  • Assertion (audio_quantum=256): ${GREEN}PASS${NC}"
            else
                echo -e "  • Assertion (audio_quantum=256): ${RED}FAIL${NC}"
                errors=$((errors + 1))
            fi
            ;;
        bobzzite-nvidia)
            if grep -q '"compositor": "kwin_wayland"' "$json_file"; then
                echo -e "  • Assertion (compositor=kwin_wayland): ${GREEN}PASS${NC}"
            else
                echo -e "  • Assertion (compositor=kwin_wayland): ${RED}FAIL${NC}"
                errors=$((errors + 1))
            fi
            if grep -q '"nvenc"' "$json_file"; then
                echo -e "  • Assertion (encoder=nvenc): ${GREEN}PASS${NC}"
            else
                echo -e "  • Assertion (encoder=nvenc): ${RED}FAIL${NC}"
                errors=$((errors + 1))
            fi
            ;;
        bobzzite)
            if grep -q '"compositor": "kwin_wayland"' "$json_file"; then
                echo -e "  • Assertion (compositor=kwin_wayland): ${GREEN}PASS${NC}"
            else
                echo -e "  • Assertion (compositor=kwin_wayland): ${RED}FAIL${NC}"
                errors=$((errors + 1))
            fi
            if grep -q '"vaapi"' "$json_file"; then
                echo -e "  • Assertion (encoder=vaapi): ${GREEN}PASS${NC}"
            else
                echo -e "  • Assertion (encoder=vaapi): ${RED}FAIL${NC}"
                errors=$((errors + 1))
            fi
            ;;
    esac

    if [ "$errors" -eq 0 ]; then
        echo -e "  ${BOLD}${GREEN}✔ Profile validation passed for ${flavor}.${NC}\n"
        return 0
    else
        echo -e "  ${BOLD}${RED}✘ Profile validation failed for ${flavor} ($errors errors).${NC}\n"
        return 1
    fi
}

case "$TARGET" in
    bobzzite|bobzzite-deck|bobzzite-nvidia)
        validate_flavor_profile "$TARGET"
        ;;
    all)
        validate_flavor_profile "bobzzite"
        validate_flavor_profile "bobzzite-deck"
        validate_flavor_profile "bobzzite-nvidia"
        ;;
    *)
        echo "Usage: $0 [all|bobzzite|bobzzite-deck|bobzzite-nvidia]"
        exit 1
        ;;
esac

echo -e "${BOLD}${GREEN}✔ All hardware profile validation checks passed.${NC}"
