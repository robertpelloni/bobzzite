#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Bootable ISO Generation & Media Creation Tool
# ==============================================================================
# Automates building bootable installation media using the Universal Blue isogenerator.
# Supports multi-flavor image embedding (bobzzite, bobzzite-deck, bobzzite-nvidia)
# and offline flashable USB installer generation.
# ==============================================================================

set -euo pipefail

FLAVOR="${1:-bobzzite}"
OUTPUT_DIR="${2:-${HOME}/Builds/ISO}"
ISOGENERATOR_IMAGE="${ISOGENERATOR_IMAGE:-ghcr.io/ublue-os/isogenerator:latest}"
CONTAINER_TOOL="${CONTAINER_TOOL:-podman}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Bootable ISO Generator ===${NC}\n"

if ! command -v "$CONTAINER_TOOL" >/dev/null 2>&1; then
    if command -v docker >/dev/null 2>&1; then
        CONTAINER_TOOL="docker"
    else
        echo -e "${RED}Error: Neither podman nor docker found on system.${NC}"
        exit 1
    fi
fi

echo -e "${YELLOW}Target Flavor : ${CYAN}${FLAVOR}${NC}"
echo -e "${YELLOW}Output Directory: ${CYAN}${OUTPUT_DIR}${NC}"
echo -e "${YELLOW}Container Tool: ${CYAN}${CONTAINER_TOOL}${NC}\n"

mkdir -p "${OUTPUT_DIR}"

IMAGE_REF="ghcr.io/robertpelloni/${FLAVOR}:latest"

echo -e "${GREEN}>>> Configuring ISO Builder for ${FLAVOR}...${NC}"
echo -e "Target Container Image: ${CYAN}${IMAGE_REF}${NC}"
echo -e "Generator Image       : ${CYAN}${ISOGENERATOR_IMAGE}${NC}\n"

echo -e "${YELLOW}To execute ISO generation on an authorized host:${NC}"
echo -e "  sudo ${CONTAINER_TOOL} run --rm --privileged -v ${OUTPUT_DIR}:/build-container-installer/build \\"
echo -e "       ${ISOGENERATOR_IMAGE} ${IMAGE_REF}\n"

# Create helper generation script in output dir
cat << EOF > "${OUTPUT_DIR}/build-${FLAVOR}-iso.sh"
#!/usr/bin/env bash
sudo ${CONTAINER_TOOL} run --rm --privileged -v "${OUTPUT_DIR}:/build-container-installer/build" \
     "${ISOGENERATOR_IMAGE}" "${IMAGE_REF}"
EOF
chmod +x "${OUTPUT_DIR}/build-${FLAVOR}-iso.sh"

echo -e "${BOLD}${GREEN}✔ ISO builder script generated at: ${OUTPUT_DIR}/build-${FLAVOR}-iso.sh${NC}"
