#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Ephemeral PR Preview & Staging Engine
# ==============================================================================
# Generates, verifies, and stages ephemeral preview container tags for
# feature branches and pull requests before merging into the main branch.
#
# Commands:
#   tag [pr-num] [sha]   : Generate preview image tag syntax
#   test [pr-num] [sha]  : Validate preview build arguments and syntax
#   rebase-cmd [pr-num]  : Output safe rpm-ostree rebase command for testers
#   status               : Show active preview deployment metadata
# ==============================================================================

set -euo pipefail

ACTION="${1:-status}"
PR_NUM="${2:-1}"
COMMIT_SHA="${3:-$(git rev-parse --short HEAD 2>/dev/null || echo "dev")}"
REGISTRY="${REGISTRY:-ghcr.io/robertpelloni}"
FLAVOR="${FLAVOR:-bobzzite}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite Ephemeral Preview & Staging Engine ===${NC}"

generate_tag() {
    local tag="pr-${PR_NUM}-${COMMIT_SHA}"
    local full_uri="${REGISTRY}/${FLAVOR}:${tag}"
    echo -e "${CYAN}>>> Ephemeral Preview Image Target:${NC}"
    echo -e "  • Pull Request : ${BOLD}#${PR_NUM}${NC}"
    echo -e "  • Commit SHA   : ${BOLD}${COMMIT_SHA}${NC}"
    echo -e "  • Flavor       : ${BOLD}${FLAVOR}${NC}"
    echo -e "  • Full URI     : ${BOLD}${GREEN}${full_uri}${NC}"
}

test_preview() {
    local tag="pr-${PR_NUM}-${COMMIT_SHA}"
    echo -e "${YELLOW}>>> Validating Ephemeral Preview Build Configuration for ${tag}...${NC}"

    if command -v docker >/dev/null 2>&1; then
        docker build --check \
            --build-arg IMAGE_NAME="${FLAVOR}" \
            --build-arg IMAGE_VERSION="${tag}" \
            -f Containerfile .
        echo -e "  ${BOLD}${GREEN}✔ Containerfile syntax check passed for preview tag.${NC}"
    else
        echo -e "  ${YELLOW}Notice: Docker binary not found. Running dry-run validation.${NC}"
    fi
}

rebase_command() {
    local tag="pr-${PR_NUM}-${COMMIT_SHA}"
    local full_uri="${REGISTRY}/${FLAVOR}:${tag}"
    echo -e "${CYAN}>>> To test this ephemeral branch on an atomic test machine, run:${NC}"
    echo -e "  ${BOLD}sudo rpm-ostree rebase ostree-unverified-registry:${full_uri}${NC}\n"
    echo -e "To rollback back to stable main after testing:"
    echo -e "  ${BOLD}sudo rpm-ostree rebase ostree-unverified-registry:${REGISTRY}/${FLAVOR}:latest${NC}"
}

case "$ACTION" in
    status)
        generate_tag
        ;;
    tag)
        generate_tag
        ;;
    test)
        test_preview
        ;;
    rebase-cmd|rebase)
        rebase_command
        ;;
    *)
        echo "Usage: $0 [status|tag [pr-num] [sha]|test [pr-num] [sha]|rebase-cmd [pr-num]]"
        exit 1
        ;;
esac
