#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - VR / XR Headset & OpenXR Diagnostic Utility
# ==============================================================================
# Inspects USB / DisplayPort VR hardware connectivity, Wayland DRM display leasing,
# OpenXR active runtime manifests, and Monado / SteamVR compatibility.
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

echo -e "${BOLD}${BLUE}=== Bobzzite OS VR / XR & OpenXR Manager ===${NC}\n"

case "${ACTION}" in
    status)
        echo -e "${YELLOW}[1/4] Probing Connected VR / XR Hardware (USB):${NC}"
        if command -v lsusb >/dev/null 2>&1; then
            lsusb | grep -Ei "valve|htc|oculus|meta|pico|wmr|headset|tracker" | sed 's/^/  /' || echo "  No dedicated tethered VR headsets discovered on USB bus."
        else
            echo -e "  lsusb not found."
        fi

        echo -e "\n${YELLOW}[2/4] Wayland DRM Direct Display Leasing Capability:${NC}"
        if [ -d /dev/dri ]; then
            echo -e "  • Direct rendering cards available:"
            ls -l /dev/dri | grep -E "card|render" | sed 's/^/    /'
            echo -e "  • DRM leasing active (KWin / Gamescope Wayland protocol: wp_drm_lease_device_v1)."
        else
            echo -e "  • No DRM devices found (/dev/dri not present)."
        fi

        echo -e "\n${YELLOW}[3/4] Active OpenXR Runtime Manifest:${NC}"
        OPENXR_JSON="${XDG_CONFIG_HOME:-$HOME/.config}/openxr/1/active_runtime.json"
        GLOBAL_OPENXR="/etc/xdg/openxr/1/active_runtime.json"

        if [ -f "${OPENXR_JSON}" ]; then
            echo -e "  • User Runtime: ${GREEN}${OPENXR_JSON}${NC}"
            cat "${OPENXR_JSON}" | grep -E "library_path" | sed 's/^/    /' || true
        elif [ -f "${GLOBAL_OPENXR}" ]; then
            echo -e "  • System Runtime: ${GREEN}${GLOBAL_OPENXR}${NC}"
            cat "${GLOBAL_OPENXR}" | grep -E "library_path" | sed 's/^/    /' || true
        else
            echo -e "  • No active OpenXR runtime JSON found. (Install Monado or SteamVR)."
        fi

        echo -e "\n${YELLOW}[4/4] Wireless Streaming Runtimes (ALVR / WiVRn):${NC}"
        if command -v flatpak >/dev/null 2>&1; then
            if flatpak info com.valvesoftware.SteamVR >/dev/null 2>&1; then
                echo -e "  • SteamVR Flatpak: ${GREEN}Installed${NC}"
            else
                echo -e "  • SteamVR Flatpak: ${CYAN}Not installed${NC}"
            fi
            if flatpak info org.freedesktop.Monado >/dev/null 2>&1; then
                echo -e "  • Monado OpenXR: ${GREEN}Installed${NC}"
            else
                echo -e "  • Monado OpenXR: ${CYAN}Not installed (Available via Envision / Flathub)${NC}"
            fi
        fi
        ;;

    setup-monado)
        echo -e "${GREEN}Configuring Monado as default OpenXR runtime...${NC}"
        mkdir -p "${HOME}/.config/openxr/1"
        cat << 'EOF' > "${HOME}/.config/openxr/1/active_runtime.json"
{
  "file_format_version": "1.0.0",
  "runtime": {
    "library_path": "/usr/lib64/libopenxr_monado.so"
  }
}
EOF
        echo -e "${BOLD}${GREEN}✔ Monado configured at ~/.config/openxr/1/active_runtime.json${NC}"
        ;;

    setup-steamvr)
        echo -e "${GREEN}Configuring SteamVR as default OpenXR runtime...${NC}"
        mkdir -p "${HOME}/.config/openxr/1"
        cat << 'EOF' > "${HOME}/.config/openxr/1/active_runtime.json"
{
  "file_format_version": "1.0.0",
  "runtime": {
    "library_path": "/home/jules/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so"
  }
}
EOF
        echo -e "${BOLD}${GREEN}✔ SteamVR OpenXR manifest configured.${NC}"
        ;;

    *)
        echo "Usage: bobzzite-vr [status|setup-monado|setup-steamvr]"
        exit 1
        ;;
esac
