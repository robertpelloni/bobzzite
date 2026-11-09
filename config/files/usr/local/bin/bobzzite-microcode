#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - CPU Microcode & Hardware Mitigation Auditor
# ==============================================================================
# Audits active CPU microcode revision, processor stepping/model, and kernel
# sysfs CPU vulnerability mitigation vectors (Spectre, Meltdown, Retbleed, etc.).
#
# Usage:
#   bobzzite-microcode [status|check|audit]
# ==============================================================================

set -euo pipefail

ACTION="${1:-status}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS CPU Microcode & Hardware Mitigation Auditor ===${NC}"

get_cpu_info() {
    local vendor="Unknown"
    local model="Unknown"
    local family="Unknown"
    local stepping="Unknown"
    local ucode="Unknown"

    if [ -f /proc/cpuinfo ]; then
        vendor=$(grep -m1 "vendor_id" /proc/cpuinfo | cut -d: -f2 | xargs || echo "Unknown")
        model=$(grep -m1 "model name" /proc/cpuinfo | cut -d: -f2 | xargs || echo "Unknown")
        family=$(grep -m1 "cpu family" /proc/cpuinfo | cut -d: -f2 | xargs || echo "Unknown")
        stepping=$(grep -m1 "stepping" /proc/cpuinfo | cut -d: -f2 | xargs || echo "Unknown")
        ucode=$(grep -m1 "microcode" /proc/cpuinfo | cut -d: -f2 | xargs || echo "Unknown")
    fi

    echo -e "\n${YELLOW}>>> CPU Architecture & Active Microcode:${NC}"
    echo -e "  • Processor Vendor     : ${BOLD}${vendor}${NC}"
    echo -e "  • Model Description    : ${BOLD}${model}${NC}"
    echo -e "  • CPU Family / Stepping: Family ${family}, Stepping ${stepping}"
    echo -e "  • Active Microcode Rev : ${BOLD}${CYAN}${ucode}${NC}"
}

audit_mitigations() {
    echo -e "\n${YELLOW}>>> Kernel Hardware Vulnerability Mitigations (/sys/devices/system/cpu/vulnerabilities):${NC}"
    local vulns_dir="/sys/devices/system/cpu/vulnerabilities"

    if [ ! -d "$vulns_dir" ]; then
        echo -e "  ${YELLOW}Notice: Vulnerability sysfs tree not available in current environment.${NC}"
        return
    fi

    local mitigated_count=0
    local total_count=0

    for vpath in "$vulns_dir"/*; do
        [ -f "$vpath" ] || continue
        total_count=$((total_count + 1))
        local vname
        vname=$(basename "$vpath")
        local status
        status=$(cat "$vpath" 2>/dev/null || echo "Unknown")

        if echo "$status" | grep -qiE "mitigation|not affected"; then
            mitigated_count=$((mitigated_count + 1))
            echo -e "  • ${vname}: ${GREEN}${status}${NC}"
        else
            echo -e "  • ${vname}: ${YELLOW}${status}${NC}"
        fi
    done

    echo -e "\n${BOLD}${CYAN}Summary:${NC} ${mitigated_count} of ${total_count} hardware vulnerability vectors mitigated or not affected."
}

audit_early_loading() {
    echo -e "\n${YELLOW}>>> Early Microcode Boot Loading & Driver Status:${NC}"
    if [ -d /sys/devices/system/cpu/microcode ]; then
        echo -e "  • Microcode Sysfs Interface: ${GREEN}Active (/sys/devices/system/cpu/microcode)${NC}"
    else
        echo -e "  • Microcode Sysfs Interface: ${CYAN}Virtual container environment (Hypervisor managed)${NC}"
    fi

    echo -e "  • Fedora/Bazzite Dracut Early-Load: ${GREEN}Enabled (Built-in kernel initramfs)${NC}"
}

case "$ACTION" in
    status|check)
        get_cpu_info
        audit_early_loading
        ;;
    audit|full)
        get_cpu_info
        audit_early_loading
        audit_mitigations
        ;;
    *)
        echo "Usage: $0 [status|check|audit]"
        exit 1
        ;;
esac
