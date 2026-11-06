#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Audio Server Diagnostic & Profile Switcher Utility
# ==============================================================================
# Manages PipeWire and WirePlumber daemon states, queries active audio endpoints,
# tests stereo playback, and switches latency quantum buffer profiles.
# ==============================================================================

set -euo pipefail

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

ACTION="${1:-status}"

echo -e "${BOLD}${BLUE}=== Bobzzite OS Audio & PipeWire Manager ===${NC}\n"

case "${ACTION}" in
    status)
        echo -e "${YELLOW}[1/3] Checking PipeWire and WirePlumber Services:${NC}"
        if command -v systemctl >/dev/null 2>&1; then
            systemctl --user is-active pipewire 2>/dev/null && echo -e "  • PipeWire: ${GREEN}Active${NC}" || echo -e "  • PipeWire: ${CYAN}Inactive / Non-user session${NC}"
            systemctl --user is-active wireplumber 2>/dev/null && echo -e "  • WirePlumber: ${GREEN}Active${NC}" || echo -e "  • WirePlumber: ${CYAN}Inactive / Non-user session${NC}"
        else
            echo -e "  • systemctl not available in container."
        fi

        echo -e "\n${YELLOW}[2/3] Querying Audio Endpoints:${NC}"
        if command -v wpctl >/dev/null 2>&1; then
            wpctl status 2>/dev/null | grep -E "Audio|Sinks|Sources" -A 10 | sed 's/^/  /' || echo "  No WirePlumber endpoints discovered."
        elif command -v pactl >/dev/null 2>&1; then
            pactl info 2>/dev/null | grep -E "Server Name|Default Sink|Default Source" | sed 's/^/  /' || echo "  pactl probe unavailable."
        elif [ -d /proc/asound ]; then
            echo -e "  • ALSA Hardware Cards detected:"
            cat /proc/asound/cards | sed 's/^/    /'
        else
            echo -e "  • No hardware sound cards discovered."
        fi

        echo -e "\n${YELLOW}[3/3] Inspecting Current PipeWire Latency Setting:${NC}"
        if command -v pw-metadata >/dev/null 2>&1; then
            pw-metadata -n settings 0 2>/dev/null | grep -E "clock.force-quantum|clock.force-rate" | sed 's/^/  /' || echo "  Default dynamic quantum active (no override)."
        else
            echo -e "  • PipeWire metadata command pw-metadata not found."
        fi
        ;;

    low-latency)
        echo -e "${GREEN}Configuring PipeWire Low-Latency Pro-Audio Mode (Quantum = 128 / 48kHz)...${NC}"
        if command -v pw-metadata >/dev/null 2>&1; then
            pw-metadata -n settings 0 clock.force-quantum 128 2>/dev/null || true
            pw-metadata -n settings 0 clock.force-rate 48000 2>/dev/null || true
            echo -e "${BOLD}${GREEN}✔ PipeWire set to 128 quantum (~2.6ms buffer latency at 48kHz).${NC}"
        else
            echo -e "${YELLOW}Notice: pw-metadata not available. Creating persistent WirePlumber override in ~/.config/pipewire/pipewire.conf.d/...${NC}"
            mkdir -p "${HOME}/.config/pipewire/pipewire.conf.d"
            cat << 'EOF' > "${HOME}/.config/pipewire/pipewire.conf.d/99-lowlatency.conf"
context.properties = {
    default.clock.rate = 48000
    default.clock.quantum = 128
    default.clock.min-quantum = 64
    default.clock.max-quantum = 512
}
EOF
            echo -e "${BOLD}${GREEN}✔ Configuration written to ~/.config/pipewire/pipewire.conf.d/99-lowlatency.conf.${NC}"
        fi
        ;;

    reset)
        echo -e "${YELLOW}Resetting PipeWire to Default Dynamic Latency...${NC}"
        if command -v pw-metadata >/dev/null 2>&1; then
            pw-metadata -n settings 0 clock.force-quantum 0 2>/dev/null || true
            pw-metadata -n settings 0 clock.force-rate 0 2>/dev/null || true
            echo -e "${BOLD}${GREEN}✔ PipeWire dynamic quantum restored.${NC}"
        fi
        rm -f "${HOME}/.config/pipewire/pipewire.conf.d/99-lowlatency.conf" 2>/dev/null || true
        echo -e "${BOLD}${GREEN}✔ Default dynamic latency active.${NC}"
        ;;

    test)
        echo -e "${YELLOW}Playing stereo sound test...${NC}"
        if command -v speaker-test >/dev/null 2>&1; then
            speaker-test -t wav -c 2 -l 1 || true
        elif command -v canberra-gtk-play >/dev/null 2>&1; then
            canberra-gtk-play -i audio-channel-front-left 2>/dev/null || true
            canberra-gtk-play -i audio-channel-front-right 2>/dev/null || true
        else
            echo -e "${YELLOW}No audio test utility installed (speaker-test/canberra-gtk-play).${NC}"
        fi
        ;;

    *)
        echo -e "Usage: bobzzite-audio [status|low-latency|reset|test]"
        exit 1
        ;;
esac
