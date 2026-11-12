#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Hardware Profile Summary & Matrix Generator
# ==============================================================================
# Aggregates version-controlled hardware profile JSON specifications from
# hardware_profiles/ and generates a comprehensive, aligned summary matrix.
#
# Formats:
#   terminal : Clean ANSI formatted table output (default)
#   json     : Consolidated JSON bundle of all profile definitions
#   markdown : Markdown formatted table output for documentation
# ==============================================================================

set -euo pipefail

FORMAT="${1:-terminal}"
PROFILES_DIR="${PROFILES_DIR:-hardware_profiles}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

if [ ! -d "$PROFILES_DIR" ]; then
    echo -e "${RED}Error: Profiles directory ${PROFILES_DIR} not found.${NC}"
    exit 1
fi

render_terminal_summary() {
    echo -e "${BOLD}${BLUE}=== Bobzzite OS Comprehensive Hardware Profile Matrix ===${NC}\n"
    printf "%-18s | %-14s | %-16s | %-24s | %-12s\n" "Flavor Target" "Architecture" "Compositor" "Target Driver Stack" "Audio Buffer"
    echo "-------------------+----------------+------------------+--------------------------+-------------"
    for f in "$PROFILES_DIR"/*.json; do
        [ -f "$f" ] || continue
        local flav arch comp drv buf
        flav=$(grep -o '"flavor": "[^"]*"' "$f" | cut -d'"' -f4)
        arch=$(grep -o '"arch": "[^"]*"' "$f" | cut -d'"' -f4)
        comp=$(grep -o '"compositor": "[^"]*"' "$f" | cut -d'"' -f4)
        drv=$(grep -o '"driver_stack": "[^"]*"' "$f" | cut -d'"' -f4)
        buf=$(grep -o '"audio_quantum_default": [0-9]*' "$f" | awk '{print $2}')
        printf "%-18s | %-14s | %-16s | %-24s | %-12s\n" "$flav" "$arch" "$comp" "$drv" "${buf} frames"
    done
    echo ""
}

render_markdown_summary() {
    echo "| Flavor Target | Architecture | Compositor | Target Driver Stack | Audio Buffer |"
    echo "| :--- | :--- | :--- | :--- | :--- |"
    for f in "$PROFILES_DIR"/*.json; do
        [ -f "$f" ] || continue
        local flav arch comp drv buf
        flav=$(grep -o '"flavor": "[^"]*"' "$f" | cut -d'"' -f4)
        arch=$(grep -o '"arch": "[^"]*"' "$f" | cut -d'"' -f4)
        comp=$(grep -o '"compositor": "[^"]*"' "$f" | cut -d'"' -f4)
        drv=$(grep -o '"driver_stack": "[^"]*"' "$f" | cut -d'"' -f4)
        buf=$(grep -o '"audio_quantum_default": [0-9]*' "$f" | awk '{print $2}')
        echo "| **\`${flav}\`** | \`${arch}\` | \`${comp}\` | ${drv} | ${buf} frames |"
    done
}

render_json_bundle() {
    echo "{"
    echo '  "profiles": ['
    local first=1
    for f in "$PROFILES_DIR"/*.json; do
        [ -f "$f" ] || continue
        if [ "$first" -eq 1 ]; then
            first=0
        else
            echo ","
        fi
        cat "$f"
    done
    echo ""
    echo "  ]"
    echo "}"
}

case "$FORMAT" in
    terminal|table)
        render_terminal_summary
        ;;
    markdown|md)
        render_markdown_summary
        ;;
    json)
        render_json_bundle
        ;;
    *)
        echo "Usage: $0 [terminal|markdown|json]"
        exit 1
        ;;
esac
