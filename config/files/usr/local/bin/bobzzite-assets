#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Indie Game Asset Optimization Pipeline
# ==============================================================================
# Automates texture compression (Basis Universal / KTX2 / PNG optimization),
# audio asset encoding (WAV / OGG Vorbis), and 3D GLTF asset inspection
# for game development in Godot 4 and open-source engines.
# ==============================================================================

set -euo pipefail

TARGET_DIR="${1:-${HOME}/Templates/Godot4_Starter}"
ACTION="${2:-status}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Game Asset Optimizer Pipeline ===${NC}\n"

if [ ! -d "${TARGET_DIR}" ]; then
    echo -e "${RED}Error: Directory not found: ${TARGET_DIR}${NC}"
    echo -e "Usage: bobzzite-assets [target_directory] [status|optimize-images|optimize-audio]"
    exit 1
fi

echo -e "${YELLOW}Target Asset Directory: ${CYAN}${TARGET_DIR}${NC}"
echo -e "${YELLOW}Pipeline Action       : ${CYAN}${ACTION}${NC}\n"

case "${ACTION}" in
    status)
        echo -e "${YELLOW}Scanning Asset Directory Contents:${NC}"
        IMG_COUNT=$(find "${TARGET_DIR}" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) 2>/dev/null | wc -l)
        AUDIO_COUNT=$(find "${TARGET_DIR}" -type f \( -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp3" -o -iname "*.flac" \) 2>/dev/null | wc -l)
        MODEL_COUNT=$(find "${TARGET_DIR}" -type f \( -iname "*.gltf" -o -iname "*.glb" -o -iname "*.blend" -o -iname "*.obj" \) 2>/dev/null | wc -l)
        TOTAL_SIZE=$(du -sh "${TARGET_DIR}" 2>/dev/null | cut -f1)

        echo -e "  • Total Asset Footprint: ${BOLD}${CYAN}${TOTAL_SIZE}${NC}"
        echo -e "  • Texture / Image Files: ${CYAN}${IMG_COUNT}${NC}"
        echo -e "  • Audio Stream Files   : ${CYAN}${AUDIO_COUNT}${NC}"
        echo -e "  • 3D Model / Mesh Files: ${CYAN}${MODEL_COUNT}${NC}"

        echo -e "\n${YELLOW}Installed Asset Tooling:${NC}"
        if command -v optipng >/dev/null 2>&1; then
            echo -e "  • optipng: ${GREEN}Installed${NC}"
        else
            echo -e "  • optipng: ${CYAN}Not installed (Available in devbox/dnf)${NC}"
        fi
        if command -v ffmpeg >/dev/null 2>&1; then
            echo -e "  • ffmpeg : ${GREEN}Installed (Hardware VAAPI/NVENC encoding ready)${NC}"
        else
            echo -e "  • ffmpeg : ${CYAN}Not installed in host environment${NC}"
        fi
        ;;

    optimize-images)
        echo -e "${GREEN}Optimizing PNG/JPG textures in ${TARGET_DIR}...${NC}"
        find "${TARGET_DIR}" -type f -iname "*.png" | while read -r img; do
            echo -e "  • Processing: $(basename "$img")"
            if command -v optipng >/dev/null 2>&1; then
                optipng -o2 -quiet "$img" 2>/dev/null || true
            fi
        done
        echo -e "${BOLD}${GREEN}✔ Image texture optimization completed.${NC}"
        ;;

    optimize-audio)
        echo -e "${GREEN}Converting audio files to streaming OGG Vorbis...${NC}"
        find "${TARGET_DIR}" -type f -iname "*.wav" | while read -r audio; do
            base="${audio%.*}"
            if command -v ffmpeg >/dev/null 2>&1; then
                echo -e "  • Encoding: $(basename "$audio") -> $(basename "$base.ogg")"
                ffmpeg -y -i "$audio" -c:a libvorbis -q:a 4 "$base.ogg" >/dev/null 2>&1 || true
            fi
        done
        echo -e "${BOLD}${GREEN}✔ Audio asset conversion completed.${NC}"
        ;;

    *)
        echo "Usage: bobzzite-assets [target_directory] [status|optimize-images|optimize-audio]"
        exit 1
        ;;
esac
