#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Local Deployment & Rebase Automation Tool
# ==============================================================================
# Automates switching, rebasing, and local deployment across bobzzite hardware flavors:
#   • bobzzite        : Desktop AMD / Intel Arc
#   • bobzzite-deck   : Steam Deck / ROG Ally / Legion Go
#   • bobzzite-nvidia : NVIDIA GeForce Desktop & Laptop
# Supports both GHCR remote registry rebases and local OCI archive file deployments.
# ==============================================================================

set -euo pipefail

TARGET="${1:-status}"
SOURCE_TYPE="${2:-registry}" # registry | oci-archive
REGISTRY_URL="${REGISTRY_URL:-ghcr.io/robertpelloni}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

detect_hardware_flavor() {
    local detected_flavor="bobzzite"
    local dmi_product=""
    local has_nvidia=0

    if [ -f /sys/class/dmi/id/product_name ]; then
        dmi_product=$(cat /sys/class/dmi/id/product_name 2>/dev/null || true)
    fi

    # Check for handheld PCs (Steam Deck, ROG Ally, Legion Go)
    if echo "${dmi_product}" | grep -Ei "jupiter|galileo|rog ally|legion go|ayaneo|gpd|onexplayer" >/dev/null 2>&1; then
        detected_flavor="bobzzite-deck"
        echo -e "  • Detected Handheld PC: ${CYAN}${dmi_product}${NC}"
        echo "${detected_flavor}"
        return 0
    fi

    # Check for NVIDIA GPUs via lspci
    if command -v lspci >/dev/null 2>&1; then
        if lspci -nn | grep -Ei "vga|3d|display" | grep -Ei "10de" >/dev/null 2>&1; then
            has_nvidia=1
        fi
    fi

    if [ "${has_nvidia}" -eq 1 ]; then
        detected_flavor="bobzzite-nvidia"
        echo -e "  • Detected Dedicated NVIDIA GPU"
    else
        echo -e "  • Detected Standard Desktop/Laptop (AMD Radeon / Intel Graphics)"
    fi

    echo "${detected_flavor}"
}

analyze_hardware_profile() {
    echo -e "${YELLOW}>>> Running Deep Host Hardware Profile Analysis...${NC}"

    local dmi_product="Unknown / Generic Virtual System"
    if [ -f /sys/class/dmi/id/product_name ]; then
        dmi_product=$(cat /sys/class/dmi/id/product_name 2>/dev/null || echo "Generic")
    fi

    local cpu_cores
    cpu_cores=$(nproc 2>/dev/null || echo "4")

    local has_dri=0
    if [ -c /dev/dri/renderD128 ]; then
        has_dri=1
    fi

    local has_nvidia=0
    if command -v lspci >/dev/null 2>&1; then
        if lspci -nn | grep -Ei "vga|3d|display" | grep -Ei "10de" >/dev/null 2>&1; then
            has_nvidia=1
        fi
    fi

    local is_handheld=0
    if echo "${dmi_product}" | grep -Ei "jupiter|galileo|rog ally|legion go|ayaneo|gpd|onexplayer" >/dev/null 2>&1; then
        is_handheld=1
    fi

    echo -e "  • DMI Hardware Identification : ${CYAN}${dmi_product}${NC}"
    echo -e "  • Available CPU Compute Cores : ${CYAN}${cpu_cores}${NC}"
    echo -e "  • Direct Rendering Manager    : $([ "$has_dri" -eq 1 ] && echo -e "${GREEN}Available (/dev/dri/renderD128)${NC}" || echo -e "${YELLOW}Not detected${NC})"
    echo -e "  • Discrete NVIDIA Hardware    : $([ "$has_nvidia" -eq 1 ] && echo -e "${GREEN}Detected${NC}" || echo -e "${CYAN}None${NC})"
    echo -e "  • Handheld Form Factor Quirks : $([ "$is_handheld" -eq 1 ] && echo -e "${GREEN}Detected (Handheld Daemon active)${NC}" || echo -e "${CYAN}Standard Desktop/Laptop${NC})"

    echo -e "\n${BOLD}Hardware Flavor Fit Score & Suitability:${NC}"
    if [ "$is_handheld" -eq 1 ]; then
        echo -e "  1. ${BOLD}bobzzite-deck${NC}   : ${GREEN}100% Fit (Recommended Target)${NC}"
        echo -e "  2. ${BOLD}bobzzite${NC}        : ${YELLOW}70% Fit (Missing Gamescope Handheld UI)${NC}"
        echo -e "  3. ${BOLD}bobzzite-nvidia${NC} : ${RED}20% Fit (Incompatible Driver Stack)${NC}"
        echo -e "\n${BOLD}${GREEN}Recommended Action:${NC} Rebase to ${BOLD}bobzzite-deck${NC} for optimal TDP, gyro, and Gamescope compositing."
    elif [ "$has_nvidia" -eq 1 ]; then
        echo -e "  1. ${BOLD}bobzzite-nvidia${NC} : ${GREEN}100% Fit (Recommended Target)${NC}"
        echo -e "  2. ${BOLD}bobzzite${NC}        : ${YELLOW}60% Fit (Open Nouveau Fallback)${NC}"
        echo -e "  3. ${BOLD}bobzzite-deck${NC}   : ${RED}30% Fit (Handheld APU specific)${NC}"
        echo -e "\n${BOLD}${GREEN}Recommended Action:${NC} Rebase to ${BOLD}bobzzite-nvidia${NC} for proprietary 565+ drivers and NVENC acceleration."
    else
        echo -e "  1. ${BOLD}bobzzite${NC}        : ${GREEN}100% Fit (Recommended Target)${NC}"
        echo -e "  2. ${BOLD}bobzzite-deck${NC}   : ${YELLOW}65% Fit (Unnecessary Gamescope UI)${NC}"
        echo -e "  3. ${BOLD}bobzzite-nvidia${NC} : ${RED}10% Fit (Unnecessary NVIDIA Drivers)${NC}"
        echo -e "\n${BOLD}${GREEN}Recommended Action:${NC} Rebase to ${BOLD}bobzzite${NC} for lightweight open-source Mesa drivers and standard desktop session."
    fi
}

echo -e "${BOLD}${BLUE}=== Bobzzite OS Rebase & Deployment Manager ===${NC}\n"

case "${TARGET}" in
    detect|auto-detect)
        echo -e "${YELLOW}Probing System Architecture & Hardware Signatures:${NC}"
        RECOMMENDED_FLAVOR=$(detect_hardware_flavor | tail -n 1)
        echo -e "\n${BOLD}${GREEN}Recommended Hardware Flavor: ${YELLOW}${RECOMMENDED_FLAVOR}${NC}"
        echo -e "To rebase to this flavor automatically, execute:"
        echo -e "  ${BOLD}bobzzite-deploy ${RECOMMENDED_FLAVOR}${NC}\n"
        ;;

    profile-analyze|analyze)
        analyze_hardware_profile
        ;;

    profile-inspect|inspect)
        FLAVOR="${2:-bobzzite}"
        echo -e "${YELLOW}Inspecting Hardware Profile Specification: ${BOLD}${FLAVOR}${NC}"
        PROFILES_DIR="/usr/share/bobzzite/hardware_profiles"
        if [ ! -d "$PROFILES_DIR" ] && [ -d "hardware_profiles" ]; then
            PROFILES_DIR="hardware_profiles"
        fi
        PROFILE_FILE="${PROFILES_DIR}/${FLAVOR}.json"
        if [ -f "$PROFILE_FILE" ]; then
            cat "$PROFILE_FILE"
        else
            echo -e "${RED}Error: Hardware profile ${PROFILE_FILE} not found.${NC}"
            exit 1
        fi
        ;;

    profile-compare|compare)
        FLAVOR1="${2:-bobzzite}"
        FLAVOR2="${3:-bobzzite-deck}"
        echo -e "${YELLOW}Comparing Hardware Profiles: ${BOLD}${FLAVOR1} ⇄ ${FLAVOR2}${NC}"
        if command -v bobzzite-diff >/dev/null 2>&1; then
            bobzzite-diff "$FLAVOR1" "$FLAVOR2" terminal
        elif [ -f scripts/bobzzite-diff.sh ]; then
            ./scripts/bobzzite-diff.sh "$FLAVOR1" "$FLAVOR2" terminal
        else
            echo "bobzzite-diff tool not found."
            exit 1
        fi
        ;;

    profile-audit|audit)
        echo -e "${YELLOW}Invoking Deep Hardware Compliance Auditor...${NC}"
        if command -v bobzzite-hardware-audit >/dev/null 2>&1; then
            bobzzite-hardware-audit
        elif [ -f scripts/bobzzite-hardware-audit.sh ]; then
            ./scripts/bobzzite-hardware-audit.sh
        else
            echo "bobzzite-hardware-audit tool not found."
            exit 1
        fi
        ;;

    profile-validate|validate)
        FLAVOR="${2:-all}"
        echo -e "${YELLOW}Validating Target Hardware Profile Assertions: ${BOLD}${FLAVOR}${NC}"
        if command -v bobzzite-profile-validate >/dev/null 2>&1; then
            bobzzite-profile-validate "$FLAVOR"
        elif [ -f scripts/bobzzite-profile-validate.sh ]; then
            ./scripts/bobzzite-profile-validate.sh "$FLAVOR"
        else
            echo "bobzzite-profile-validate tool not found."
            exit 1
        fi
        ;;

    status)
        echo -e "${YELLOW}Querying active OS deployment and staged refs:${NC}"
        if command -v rpm-ostree >/dev/null 2>&1; then
            rpm-ostree status
        else
            echo -e "${CYAN}rpm-ostree is not installed in the current environment (container/chroot).${NC}"
            if [ -f /etc/bobzzite-release ]; then
                echo -e "Local release metadata:"
                cat /etc/bobzzite-release | sed 's/^/  /'
            fi
        fi
        ;;

    bobzzite|bobzzite-deck|bobzzite-nvidia)
        echo -e "${GREEN}Initiating rebase to flavor: ${BOLD}${TARGET}${NC}..."
        if ! command -v rpm-ostree >/dev/null 2>&1; then
            echo -e "${YELLOW}Notice: Host is running in a non-atomic or container environment.${NC}"
            echo -e "On an active atomic host, the command executed would be:"
            if [ "${SOURCE_TYPE}" = "oci-archive" ]; then
                echo -e "  ${BOLD}sudo rpm-ostree rebase ostree-unverified-image:oci-archive:/var/tmp/${TARGET}.tar.gz${NC}"
            else
                echo -e "  ${BOLD}sudo rpm-ostree rebase ostree-unverified-registry:${REGISTRY_URL}/${TARGET}:latest${NC}"
            fi
            exit 0
        fi

        if [ "${SOURCE_TYPE}" = "oci-archive" ]; then
            ARCHIVE_PATH="/var/tmp/${TARGET}.tar.gz"
            if [ ! -f "${ARCHIVE_PATH}" ]; then
                echo -e "${RED}Error: OCI archive file not found at ${ARCHIVE_PATH}${NC}"
                exit 1
            fi
            echo -e "Rebasing from local OCI archive ${ARCHIVE_PATH}..."
            sudo rpm-ostree rebase "ostree-unverified-image:oci-archive:${ARCHIVE_PATH}"
        else
            echo -e "Rebasing from container registry: ${REGISTRY_URL}/${TARGET}:latest..."
            sudo rpm-ostree rebase "ostree-unverified-registry:${REGISTRY_URL}/${TARGET}:latest"
        fi

        echo -e "${BOLD}${GREEN}✔ Rebase staged successfully. Please reboot to switch into ${TARGET}.${NC}"
        ;;

    *)
        echo "Usage: bobzzite-deploy [status|detect|profile-analyze|profile-inspect|profile-compare|profile-audit|profile-validate|bobzzite|bobzzite-deck|bobzzite-nvidia] [flavor|registry|oci-archive]"
        exit 1
        ;;
esac
