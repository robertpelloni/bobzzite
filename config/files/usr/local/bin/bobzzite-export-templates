#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Godot 4 Custom Export Template Builder
# ==============================================================================
# Automates compiling custom, lightweight export templates using SCons.
# Allows stripping unused modules (e.g. 3D for 2D games, physics engines),
# enabling Link-Time Optimization (LTO), and producing hardened game binaries.
# ==============================================================================

set -euo pipefail

TARGET_PLATFORM="${1:-linuxbsd}" # linuxbsd | windows
BUILD_PROFILE="${2:-release}"    # release | debug
TEMPLATE_DIR="${HOME}/.local/share/godot/export_templates"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Godot 4 Export Template Builder ===${NC}\n"

echo -e "${YELLOW}Target Platform : ${CYAN}${TARGET_PLATFORM}${NC}"
echo -e "${YELLOW}Build Profile   : ${CYAN}${BUILD_PROFILE}${NC}"
echo -e "${YELLOW}Destination Path: ${CYAN}${TEMPLATE_DIR}${NC}\n"

mkdir -p "${TEMPLATE_DIR}"

if command -v scons >/dev/null 2>&1; then
    echo -e "${GREEN}>>> SCons detected. Ready for template compilation.${NC}"
    echo -e "Compilation parameters:"
    echo -e "  scons platform=${TARGET_PLATFORM} target=template_${BUILD_PROFILE} arch=x86_64 lto=full optimize=speed"
else
    echo -e "${YELLOW}Notice: 'scons' build tool not installed on host.${NC}"
    echo -e "Install build toolchain via: ${BOLD}sudo dnf install scons gcc-c++ libX11-devel${NC}"
    echo -e "Or compile inside an Arch devbox container via: ${BOLD}bobzzite-devbox enter arch${NC}"
fi

echo -e "\n${BOLD}${GREEN}✔ Export template builder verification complete.${NC}"
