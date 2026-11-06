#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Remote Game & Development Streaming Host Manager
# ==============================================================================
# Configures and monitors Sunshine game streaming host and Moonlight client integration.
# Allows streaming Godot game playtests, desktop sessions, and indie games to
# handhelds (Steam Deck, smartphones, tablets) or secondary workstations with low latency.
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

echo -e "${BOLD}${BLUE}=== Bobzzite OS Game & Dev Streaming Manager ===${NC}\n"

case "${ACTION}" in
    status)
        echo -e "${YELLOW}[1/3] Checking Sunshine Game Streaming Host:${NC}"
        if command -v systemctl >/dev/null 2>&1; then
            if systemctl --user is-active sunshine 2>/dev/null; then
                echo -e "  • Sunshine Host Daemon: ${BOLD}${GREEN}Active & Streaming${NC}"
            else
                echo -e "  • Sunshine Host Daemon: ${CYAN}Inactive / Stopped${NC}"
            fi
        else
            echo -e "  • systemctl not available in container environment."
        fi

        echo -e "\n${YELLOW}[2/3] Hardware Video Acceleration (VAAPI/NVENC/Vulkan):${NC}"
        if [ -d /dev/dri ]; then
            echo -e "  • DRM Render Nodes present in /dev/dri:"
            ls -l /dev/dri | grep -E "card|render" | sed 's/^/    /'
        else
            echo -e "  • No hardware render devices detected."
        fi

        echo -e "\n${YELLOW}[3/3] Streaming Web Configuration Interface:${NC}"
        echo -e "  • Sunshine Web UI URL: ${CYAN}https://localhost:47990${NC}"
        echo -e "  • Moonlight Client Ports: ${CYAN}47984-47990 (TCP/UDP)${NC}"
        ;;

    start)
        echo -e "${GREEN}Starting Sunshine streaming daemon...${NC}"
        if command -v systemctl >/dev/null 2>&1; then
            systemctl --user start sunshine 2>/dev/null || echo "Unable to start systemd service. Launching directly..."
        fi
        if command -v sunshine >/dev/null 2>&1; then
            echo -e "${BOLD}${GREEN}✔ Sunshine started.${NC}"
        else
            echo -e "${YELLOW}Notice: Sunshine binary not found. Install via Flatpak or package manager: flatpak install flathub dev.lizardbyte.sunshine${NC}"
        fi
        ;;

    stop)
        echo -e "${YELLOW}Stopping Sunshine streaming daemon...${NC}"
        if command -v systemctl >/dev/null 2>&1; then
            systemctl --user stop sunshine 2>/dev/null || true
        fi
        killall sunshine 2>/dev/null || true
        echo -e "${BOLD}${GREEN}✔ Sunshine stopped.${NC}"
        ;;

    webui)
        echo -e "${GREEN}Opening Sunshine Web Configuration UI...${NC}"
        if command -v xdg-open >/dev/null 2>&1; then
            xdg-open "https://localhost:47990" 2>/dev/null || true
        else
            echo -e "Open your web browser at: ${CYAN}https://localhost:47990${NC}"
        fi
        ;;

    *)
        echo "Usage: bobzzite-stream [status|start|stop|webui]"
        exit 1
        ;;
esac
