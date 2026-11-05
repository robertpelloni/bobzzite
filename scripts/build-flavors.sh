#!/bin/bash
set -euo pipefail

# Bobzzite Multi-Hardware Flavor Build Script
# Builds container images across hardware target flavors:
#  - bobzzite        : Desktop AMD / Intel Arc
#  - bobzzite-deck   : Steam Deck / ASUS ROG Ally / Lenovo Legion Go
#  - bobzzite-nvidia : Desktop & Laptop NVIDIA GeForce GPUs

FLAVOR="${1:-all}"
IMAGE_VERSION="${2:-1.4.0}"
BUILD_TOOL="${BUILD_TOOL:-docker}"

if ! command -v "$BUILD_TOOL" >/dev/null 2>&1; then
    if command -v podman >/dev/null 2>&1; then
        BUILD_TOOL="podman"
    else
        echo "Neither docker nor podman found."
        exit 1
    fi
fi

build_flavor() {
    local target_flavor="$1"
    local base_image="ghcr.io/ublue-os/bazzite:latest"

    case "$target_flavor" in
        bobzzite-deck)
            base_image="ghcr.io/ublue-os/bazzite-deck:latest"
            ;;
        bobzzite-nvidia)
            base_image="ghcr.io/ublue-os/bazzite-nvidia:latest"
            ;;
        bobzzite)
            base_image="ghcr.io/ublue-os/bazzite:latest"
            ;;
        *)
            echo "Unknown flavor: $target_flavor"
            return 1
            ;;
    esac

    echo "=== Building $target_flavor (Base: $base_image) ==="
    $BUILD_TOOL build \
        --build-arg BASE_IMAGE="$base_image" \
        --build-arg IMAGE_NAME="$target_flavor" \
        --build-arg IMAGE_VERSION="$IMAGE_VERSION" \
        -t "$target_flavor:latest" \
        -t "$target_flavor:$IMAGE_VERSION" \
        -f Containerfile .
    echo "=== Finished $target_flavor ==="
}

case "$FLAVOR" in
    bobzzite|bobzzite-deck|bobzzite-nvidia)
        build_flavor "$FLAVOR"
        ;;
    all)
        build_flavor "bobzzite"
        build_flavor "bobzzite-deck"
        build_flavor "bobzzite-nvidia"
        ;;
    *)
        echo "Usage: $0 [all|bobzzite|bobzzite-deck|bobzzite-nvidia] [version]"
        exit 1
        ;;
esac
