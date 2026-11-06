#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Flatpak Application Builder Tooling
# ==============================================================================
# Builds, tests, and exports local Flatpak bundles and repositories for
# bob ecosystem applications (bobzilla, bobfilez).
# Supports automated builds, local export, and bundle creation.
# ==============================================================================

set -euo pipefail

APP="${1:-all}"
ACTION="${2:-build}"
BUILD_DIR="${HOME}/.flatpak-builds"
REPO_DIR="${BUILD_DIR}/repo"
BUNDLE_DIR="${BUILD_DIR}/bundles"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite Flatpak Builder Tooling ===${NC}\n"

# Verify flatpak-builder availability
if ! command -v flatpak-builder >/dev/null 2>&1; then
    echo -e "${YELLOW}Warning: 'flatpak-builder' is not installed in the current environment.${NC}"
    echo -e "You can install it on the host via: ${BOLD}flatpak install -y org.flatpak.Builder${NC}"
    echo -e "Or execute inside an Arch/Ubuntu container via: ${BOLD}bobzzite-devbox enter arch${NC}\n"
    exit 0
fi

mkdir -p "${REPO_DIR}" "${BUNDLE_DIR}"

build_app() {
    local manifest="$1"
    local app_id
    app_id=$(basename "$manifest" .yml)
    echo -e "${GREEN}>>> Building Flatpak Manifest: ${app_id}${NC}"
    mkdir -p "${BUILD_DIR}/${app_id}"

    flatpak-builder \
        --force-clean \
        --user \
        --install-deps-from=flathub \
        --repo="${REPO_DIR}" \
        "${BUILD_DIR}/${app_id}" \
        "$manifest"

    if [ "${ACTION}" = "bundle" ]; then
        echo -e "${BLUE}>>> Exporting standalone .flatpak single-file bundle for ${app_id}...${NC}"
        flatpak build-bundle "${REPO_DIR}" "${BUNDLE_DIR}/${app_id}.flatpak" "${app_id}"
        echo -e "${GREEN}✔ Exported bundle: ${BUNDLE_DIR}/${app_id}.flatpak${NC}"
    fi

    echo -e "${BOLD}${GREEN}✔ Finished building ${app_id}.${NC}\n"
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
    clean)
        echo -e "${YELLOW}Cleaning Flatpak build artifacts in ${BUILD_DIR}...${NC}"
        rm -rf "${BUILD_DIR}"
        echo -e "${GREEN}Build directory cleaned.${NC}"
        ;;
    *)
        echo "Usage: $0 [all|bobzilla|bobfilez|clean] [build|bundle]"
        exit 1
        ;;
esac
