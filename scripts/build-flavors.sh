#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Multi-Hardware Flavor Build Automation Engine
# ==============================================================================
# Builds, tests, and verifies container images across hardware target flavors:
#   • bobzzite        : Desktop AMD / Intel Arc
#   • bobzzite-deck   : Handheld PCs (Steam Deck LCD/OLED, ROG Ally, Legion Go)
#   • bobzzite-nvidia : Desktop & Laptop NVIDIA GeForce RTX / GTX
#
# Supports dry-run validation, custom tagging, export manifests, and syntax checks.
# ==============================================================================

set -euo pipefail

FLAVOR="${1:-all}"
ACTION="${2:-build}" # build | check | dry-run | manifest | export-tar | test-matrix
IMAGE_VERSION="${3:-$(cat VERSION.md 2>/dev/null || echo "3.0.0")}"
BUILD_TOOL="${BUILD_TOOL:-docker}"
EXPORT_DIR="${EXPORT_DIR:-/tmp/bobzzite-flavors}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

if ! command -v "$BUILD_TOOL" >/dev/null 2>&1; then
    if command -v podman >/dev/null 2>&1; then
        BUILD_TOOL="podman"
    else
        echo -e "${RED}Error: Neither docker nor podman container runtime found.${NC}"
        exit 1
    fi
fi

echo -e "${BOLD}${BLUE}=== Bobzzite Multi-Hardware Flavor Build Engine ===${NC}"
echo -e "Container Runtime : ${CYAN}${BUILD_TOOL}${NC}"
echo -e "Target Version    : ${CYAN}${IMAGE_VERSION}${NC}"
echo -e "Requested Action  : ${CYAN}${ACTION}${NC}\n"

get_base_image() {
    local target="$1"
    case "$target" in
        bobzzite-deck)
            echo "ghcr.io/ublue-os/bazzite-deck:latest"
            ;;
        bobzzite-nvidia)
            echo "ghcr.io/ublue-os/bazzite-nvidia:latest"
            ;;
        bobzzite)
            echo "ghcr.io/ublue-os/bazzite:latest"
            ;;
        *)
            echo "ghcr.io/ublue-os/bazzite:latest"
            ;;
    esac
}

process_flavor() {
    local target_flavor="$1"
    local base_image
    base_image=$(get_base_image "$target_flavor")

    echo -e "${YELLOW}>>> Target Flavor: ${BOLD}${target_flavor}${NC} (Upstream Base: ${base_image})"

    case "${ACTION}" in
        check|dry-run)
            echo -e "  [DRY-RUN] Verifying Containerfile syntax and base argument compatibility..."
            $BUILD_TOOL build --check \
                --build-arg BASE_IMAGE="$base_image" \
                --build-arg IMAGE_NAME="$target_flavor" \
                --build-arg IMAGE_VERSION="$IMAGE_VERSION" \
                -f Containerfile .
            echo -e "  ${GREEN}✔ Verification passed for ${target_flavor}.${NC}\n"
            ;;
        test-matrix)
            echo -e "  [MATRIX-TEST] Running comprehensive build argument and base integrity test..."
            if [ ! -f Containerfile ]; then
                echo -e "  ${RED}Error: Containerfile missing!${NC}"
                return 1
            fi
            echo -e "    • Testing target flavor: ${CYAN}${target_flavor}${NC}"
            echo -e "    • Validating upstream base image: ${CYAN}${base_image}${NC}"
            $BUILD_TOOL build --check \
                --build-arg BASE_IMAGE="$base_image" \
                --build-arg IMAGE_NAME="$target_flavor" \
                --build-arg IMAGE_VERSION="$IMAGE_VERSION" \
                -f Containerfile .
            echo -e "  ${BOLD}${GREEN}✔ Matrix test passed for ${target_flavor}.${NC}\n"
            ;;
        export-tar)
            mkdir -p "${EXPORT_DIR}"
            local tar_path="${EXPORT_DIR}/${target_flavor}.tar.gz"
            echo -e "  [EXPORT] Archiving ${target_flavor}:latest to ${tar_path}..."
            $BUILD_TOOL save "$target_flavor:latest" | gzip > "${tar_path}"
            echo -e "  ${BOLD}${GREEN}✔ Exported OCI archive to ${tar_path}.${NC}\n"
            ;;
        manifest)
            echo -e "  [MANIFEST] Flavor Metadata:"
            echo -e "    - Flavor Name    : ${target_flavor}"
            echo -e "    - Upstream Base  : ${base_image}"
            echo -e "    - Primary Tag    : ${target_flavor}:latest"
            echo -e "    - Versioned Tag  : ${target_flavor}:${IMAGE_VERSION}"
            echo -e "    - Target Hardware: $(case "$target_flavor" in
                bobzzite-deck) echo "Steam Deck (LCD/OLED), ROG Ally, Legion Go (Handheld Gamepad UI)";;
                bobzzite-nvidia) echo "NVIDIA Proprietary Drivers (RTX 30xx/40xx, NVDEC/NVENC)";;
                bobzzite) echo "Desktop / Laptop AMD Radeon & Intel Arc (Open Source Mesa)";;
            esac)\n"
            ;;
        build)
            echo -e "  [BUILD] Compiling container image for ${target_flavor}..."
            $BUILD_TOOL build \
                --build-arg BASE_IMAGE="$base_image" \
                --build-arg IMAGE_NAME="$target_flavor" \
                --build-arg IMAGE_VERSION="$IMAGE_VERSION" \
                -t "$target_flavor:latest" \
                -t "$target_flavor:$IMAGE_VERSION" \
                -f Containerfile .
            echo -e "  ${BOLD}${GREEN}✔ Successfully built ${target_flavor}:${IMAGE_VERSION}${NC}\n"
            ;;
        *)
            echo -e "${RED}Unknown action: ${ACTION}${NC}"
            exit 1
            ;;
    esac
}

case "$FLAVOR" in
    bobzzite|bobzzite-deck|bobzzite-nvidia)
        process_flavor "$FLAVOR"
        ;;
    all)
        process_flavor "bobzzite"
        process_flavor "bobzzite-deck"
        process_flavor "bobzzite-nvidia"
        ;;
    *)
        echo "Usage: $0 [all|bobzzite|bobzzite-deck|bobzzite-nvidia] [build|check|dry-run|manifest|export-tar|test-matrix] [version]"
        exit 1
        ;;
esac

echo -e "${BOLD}${GREEN}✔ Multi-Flavor Build Engine pipeline finished.${NC}"
