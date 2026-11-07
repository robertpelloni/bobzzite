#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Godot 4 GDExtension C++ / Rust Scaffolding & Build Tool
# ==============================================================================
# Automates scaffolding, configuration, and compilation of high-performance
# native GDExtension shared libraries (.so) for Godot 4 game projects.
# ==============================================================================

set -euo pipefail

TARGET_DIR="${1:-${HOME}/Templates/Godot4_Starter}"
ACTION="${2:-status}" # status | scaffold-cpp | scaffold-rust

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS GDExtension Build Pipeline ===${NC}\n"

if [ ! -d "${TARGET_DIR}" ]; then
    echo -e "${RED}Error: Project directory not found: ${TARGET_DIR}${NC}"
    echo -e "Usage: bobzzite-gdextension [project_directory] [status|scaffold-cpp|scaffold-rust]"
    exit 1
fi

echo -e "${YELLOW}Target Project : ${CYAN}${TARGET_DIR}${NC}"
echo -e "${YELLOW}Action         : ${CYAN}${ACTION}${NC}\n"

case "${ACTION}" in
    status)
        echo -e "${YELLOW}Scanning GDExtension Manifests (*.gdextension):${NC}"
        EXT_COUNT=$(find "${TARGET_DIR}" -type f -name "*.gdextension" 2>/dev/null | wc -l)
        SO_COUNT=$(find "${TARGET_DIR}" -type f -name "*.so" 2>/dev/null | wc -l)

        echo -e "  • GDExtension Manifest Files : ${CYAN}${EXT_COUNT}${NC}"
        echo -e "  • Compiled Native Libraries  : ${CYAN}${SO_COUNT}${NC}"

        echo -e "\n${YELLOW}Native Toolchain Availability:${NC}"
        if command -v gcc >/dev/null 2>&1 || command -v clang >/dev/null 2>&1; then
            echo -e "  • C/C++ Compiler: ${GREEN}Available${NC}"
        else
            echo -e "  • C/C++ Compiler: ${CYAN}Not installed on host (Available in Distrobox devbox)${NC}"
        fi
        if command -v cargo >/dev/null 2>&1; then
            echo -e "  • Rust (Cargo)  : ${GREEN}Installed ($(cargo --version))${NC}"
        else
            echo -e "  • Rust (Cargo)  : ${CYAN}Not installed on host (Available in Distrobox devbox)${NC}"
        fi
        ;;

    scaffold-cpp)
        echo -e "${GREEN}Scaffolding C++ GDExtension in ${TARGET_DIR}/src...${NC}"
        mkdir -p "${TARGET_DIR}/src" "${TARGET_DIR}/bin"
        cat << 'EOF' > "${TARGET_DIR}/bin/custom_native.gdextension"
[configuration]
entry_symbol = "custom_native_library_init"
compatibility_minimum = "4.1"

[libraries]
linux.debug.x86_64 = "res://bin/libcustom_native.linux.debug.x86_64.so"
linux.release.x86_64 = "res://bin/libcustom_native.linux.release.x86_64.so"
EOF
        echo -e "${BOLD}${GREEN}✔ Scaffolding complete at ${TARGET_DIR}/bin/custom_native.gdextension${NC}"
        ;;

    scaffold-rust)
        echo -e "${GREEN}Scaffolding godot-rust GDExtension in ${TARGET_DIR}/rust_extension...${NC}"
        mkdir -p "${TARGET_DIR}/rust_extension" "${TARGET_DIR}/bin"
        cat << 'EOF' > "${TARGET_DIR}/bin/rust_extension.gdextension"
[configuration]
entry_symbol = "load_library"
compatibility_minimum = "4.2"

[libraries]
linux.debug.x86_64 = "res://bin/librust_extension.so"
linux.release.x86_64 = "res://bin/librust_extension.so"
EOF
        echo -e "${BOLD}${GREEN}✔ Rust GDExtension manifest created at ${TARGET_DIR}/bin/rust_extension.gdextension${NC}"
        ;;

    *)
        echo "Usage: bobzzite-gdextension [project_directory] [status|scaffold-cpp|scaffold-rust]"
        exit 1
        ;;
esac
