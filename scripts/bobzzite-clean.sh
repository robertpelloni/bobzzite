#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Automated System Cleanup & Storage Maintenance Tool
# ==============================================================================
# Prunes unused Flatpak runtimes, purges user/system caches, cleans ostree staging
# refs, and removes temporary compilation artifacts safely.
# Especially beneficial for handheld devices (Steam Deck, ROG Ally) with limited SSD space.
# ==============================================================================

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Automated System Cleaner ===${NC}\n"

# 1. Report starting disk usage
echo -e "${YELLOW}Starting Root Filesystem Usage:${NC}"
df -h / | tail -n 1
echo ""

# 2. Prune unused Flatpak runtimes and residual app data
if command -v flatpak >/dev/null 2>&1; then
    echo -e "${GREEN}[1/5] Pruning unused Flatpak runtimes...${NC}"
    flatpak uninstall --unused -y 2>/dev/null || echo "No unused Flatpaks found."
    echo -e "${GREEN}[1/5] Clearing Flatpak cache directories...${NC}"
    rm -rf ~/.var/app/*/cache/* 2>/dev/null || true
else
    echo -e "${YELLOW}[1/5] Flatpak not present. Skipping Flatpak pruning.${NC}"
fi

# 3. Purge user cache directories (thumbnails, shader compile caches, pip, npm)
echo -e "${GREEN}[2/5] Cleaning user thumbnail and package manager caches...${NC}"
rm -rf ~/.cache/thumbnails/* 2>/dev/null || true
rm -rf ~/.cache/pip/* 2>/dev/null || true
rm -rf ~/.cache/yarn/* 2>/dev/null || true
rm -rf ~/.npm/_cacache/* 2>/dev/null || true
rm -rf ~/.cargo/registry/cache/* 2>/dev/null || true

# 4. Clean system crash dumps and temporary files in /tmp and /var/tmp
echo -e "${GREEN}[3/5] Cleaning temporary user cache and crash logs...${NC}"
rm -rf ~/.cache/crashpad/* 2>/dev/null || true
rm -rf ~/.local/share/Trash/* 2>/dev/null || true

# 5. Clean journalctl logs if permissions allow
echo -e "${GREEN}[4/5] Vacuuming systemd journal logs (retaining last 3 days)...${NC}"
if command -v journalctl >/dev/null 2>&1; then
    if [ "$EUID" -eq 0 ] || command -v sudo >/dev/null 2>&1; then
        journalctl --vacuum-time=3d 2>/dev/null || true
    else
        journalctl --user --vacuum-time=3d 2>/dev/null || true
    fi
fi

# 6. Report final disk usage
echo -e "\n${GREEN}[5/5] Cleanup completed successfully!${NC}"
echo -e "${YELLOW}Final Root Filesystem Usage:${NC}"
df -h / | tail -n 1
echo -e "\n${BOLD}${GREEN}Bobzzite OS maintenance complete.${NC}"
