#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Hardware Profile Differential Analyzer
# ==============================================================================
# Compares two hardware profile specifications from hardware_profiles/ and
# highlights architectural divergences, driver changes, and migration impacts.
#
# Usage:
#   bobzzite-diff [flavor1] [flavor2] [format: terminal|json|markdown]
# ==============================================================================

set -euo pipefail

FLAVOR_A="${1:-bobzzite}"
FLAVOR_B="${2:-bobzzite-deck}"
FORMAT="${3:-terminal}"
PROFILES_DIR="${PROFILES_DIR:-hardware_profiles}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

FILE_A="${PROFILES_DIR}/${FLAVOR_A}.json"
FILE_B="${PROFILES_DIR}/${FLAVOR_B}.json"

if [ ! -f "$FILE_A" ] || [ ! -f "$FILE_B" ]; then
    echo -e "${RED}Error: One or both profile files not found (${FILE_A}, ${FILE_B}).${NC}"
    exit 1
fi

get_val() {
    local file="$1"
    local key="$2"
    grep -o "\"${key}\": [^,}]*" "$file" | cut -d: -f2 | tr -d ' "' | xargs
}

compare_terminal() {
    echo -e "${BOLD}${BLUE}=== Bobzzite OS Hardware Profile Differential Analyzer ===${NC}"
    echo -e "Comparing: ${CYAN}${FLAVOR_A}${NC}  ⇄  ${YELLOW}${FLAVOR_B}${NC}\n"

    printf "%-22s | %-30s | %-30s\n" "Attribute" "${FLAVOR_A}" "${FLAVOR_B}"
    echo "-----------------------+--------------------------------+-------------------------------"
    for key in "arch" "base_image" "compositor" "hardware_target" "driver_stack" "audio_quantum_default"; do
        local val_a val_b
        val_a=$(get_val "$FILE_A" "$key")
        val_b=$(get_val "$FILE_B" "$key")
        if [ "$val_a" = "$val_b" ]; then
            printf "%-22s | %-30s | %-30s\n" "$key" "${GREEN}${val_a}${NC}" "${GREEN}${val_b}${NC}"
        else
            printf "%-22s | %-30s | %-30s\n" "$key" "${CYAN}${val_a}${NC}" "${YELLOW}${val_b}${NC}"
        fi
    done
    echo ""
}

compare_markdown() {
    echo "## Hardware Profile Divergence: \`${FLAVOR_A}\` vs \`${FLAVOR_B}\`"
    echo ""
    echo "| Attribute | \`${FLAVOR_A}\` | \`${FLAVOR_B}\` | Status |"
    echo "| :--- | :--- | :--- | :--- |"
    for key in "arch" "base_image" "compositor" "hardware_target" "driver_stack" "audio_quantum_default"; do
        local val_a val_b status
        val_a=$(get_val "$FILE_A" "$key")
        val_b=$(get_val "$FILE_B" "$key")
        if [ "$val_a" = "$val_b" ]; then
            status="Identical"
        else
            status="Divergent"
        fi
        echo "| **\`${key}\`** | ${val_a} | ${val_b} | ${status} |"
    done
}

case "$FORMAT" in
    terminal|text)
        compare_terminal
        ;;
    markdown|md)
        compare_markdown
        ;;
    json)
        echo "{"
        echo '  "flavor_a": "'"${FLAVOR_A}"'",'
        echo '  "flavor_b": "'"${FLAVOR_B}"'",'
        echo '  "profile_a": '"$(cat "$FILE_A")"','
        echo '  "profile_b": '"$(cat "$FILE_B")"
        echo "}"
        ;;
    *)
        echo "Usage: $0 [flavor1] [flavor2] [terminal|markdown|json]"
        exit 1
        ;;
esac
