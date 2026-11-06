#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Local Deployment & Rebase Automation Tool
# ==============================================================================
# Automates switching, rebasing, and local deployment across bobzzite hardware flavors:
#   • bobzzite        : Desktop AMD / Intel Arc
#   • bobzzite-deck   : Steam Deck / ROG Ally / Legion Go
#   • bobzzite-nvidia : NVIDIA GeForce Desktop & Laptop
# Supports both GHCR remote registry rebases and local OCI archive file deployments.
# ==============================================================================

set -euo pipefail

TARGET="${1:-status}"
SOURCE_TYPE="${2:-registry}" # registry | oci-archive
REGISTRY_URL="${REGISTRY_URL:-ghcr.io/robertpelloni}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Rebase & Deployment Manager ===${NC}\n"

case "${TARGET}" in
    status)
        echo -e "${YELLOW}Querying active OS deployment and staged refs:${NC}"
        if command -v rpm-ostree >/dev/null 2>&1; then
            rpm-ostree status
        else
            echo -e "${CYAN}rpm-ostree is not installed in the current environment (container/chroot).${NC}"
            if [ -f /etc/bobzzite-release ]; then
                echo -e "Local release metadata:"
                cat /etc/bobzzite-release | sed 's/^/  /'
            fi
        fi
        ;;

    bobzzite|bobzzite-deck|bobzzite-nvidia)
        echo -e "${GREEN}Initiating rebase to flavor: ${BOLD}${TARGET}${NC}..."
        if ! command -v rpm-ostree >/dev/null 2>&1; then
            echo -e "${YELLOW}Notice: Host is running in a non-atomic or container environment.${NC}"
            echo -e "On an active atomic host, the command executed would be:"
            if [ "${SOURCE_TYPE}" = "oci-archive" ]; then
                echo -e "  ${BOLD}sudo rpm-ostree rebase ostree-unverified-image:oci-archive:/var/tmp/${TARGET}.tar.gz${NC}"
            else
                echo -e "  ${BOLD}sudo rpm-ostree rebase ostree-unverified-registry:${REGISTRY_URL}/${TARGET}:latest${NC}"
            fi
            exit 0
        fi

        if [ "${SOURCE_TYPE}" = "oci-archive" ]; then
            ARCHIVE_PATH="/var/tmp/${TARGET}.tar.gz"
            if [ ! -f "${ARCHIVE_PATH}" ]; then
                echo -e "${RED}Error: OCI archive file not found at ${ARCHIVE_PATH}${NC}"
                exit 1
            fi
            echo -e "Rebasing from local OCI archive ${ARCHIVE_PATH}..."
            sudo rpm-ostree rebase "ostree-unverified-image:oci-archive:${ARCHIVE_PATH}"
        else
            echo -e "Rebasing from container registry: ${REGISTRY_URL}/${TARGET}:latest..."
            sudo rpm-ostree rebase "ostree-unverified-registry:${REGISTRY_URL}/${TARGET}:latest"
        fi

        echo -e "${BOLD}${GREEN}✔ Rebase staged successfully. Please reboot to switch into ${TARGET}.${NC}"
        ;;

    *)
        echo "Usage: bobzzite-deploy [status|bobzzite|bobzzite-deck|bobzzite-nvidia] [registry|oci-archive]"
        exit 1
        ;;
esac
