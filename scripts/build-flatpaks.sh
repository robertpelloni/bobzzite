#!/bin/bash
set -euo pipefail

# Bobzzite Flatpak Builder Script
# Builds and exports local Flatpak bundles for bob ecosystem apps.

APP="${1:-all}"
BUILD_DIR="${HOME}/.flatpak-builds"

if ! command -v flatpak-builder >/dev/null 2>&1; then
    echo "Warning: flatpak-builder is not installed. Please install flatpak-builder on the host or inside a devbox container."
    exit 0
fi

build_app() {
    local manifest="$1"
    local app_id=$(basename "$manifest" .yml)
    echo "=== Building Flatpak: $app_id ==="
    mkdir -p "${BUILD_DIR}/${app_id}"
    flatpak-builder --force-clean --user --install-deps-from=flathub --repo="${BUILD_DIR}/repo" "${BUILD_DIR}/${app_id}" "$manifest"
    echo "=== Finished: $app_id ==="
}

case "$APP" in
    bobzilla)
        build_app packages/flatpak/com.robertpelloni.bobzilla.yml
        ;;
    bobfilez)
        build_app packages/flatpak/com.robertpelloni.bobfilez.yml
        ;;
    all)
        build_app packages/flatpak/com.robertpelloni.bobzilla.yml
        build_app packages/flatpak/com.robertpelloni.bobfilez.yml
        ;;
    *)
        echo "Usage: $0 [all|bobzilla|bobfilez]"
        exit 1
        ;;
esac
