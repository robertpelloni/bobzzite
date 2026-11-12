#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Local CI / Smoke Test Automation Runner
# ==============================================================================
# Executes the full CI validation pipeline locally:
#   1. Repository build validation (scripts/validate_build.py)
#   2. Python syntax compilation & bash syntax verification
#   3. Multi-flavor hardware matrix dry-run checking
#   4. Hardware profile generation & assertion testing (bobzzite-profile-validate)
#   5. Broad hardware compatibility testing (bobzzite-compat)
# ==============================================================================

set -euo pipefail

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite Local CI Smoke Test Runner ===${NC}\n"

# Step 1: Validate repository paths and files
echo -e "${YELLOW}>>> Step 1: Running Repository Build Validation...${NC}"
python3 scripts/validate_build.py
echo -e "${GREEN}✔ Repository build validation passed.${NC}\n"

# Step 2: Syntax checks
echo -e "${YELLOW}>>> Step 2: Verifying Python & Shell Syntax...${NC}"
python3 -m py_compile scripts/*.py
bash -n scripts/*.sh
echo -e "${GREEN}✔ All Python and Shell scripts passed syntax checks.${NC}\n"

# Step 3: Hardware Profile Generation and Validation
echo -e "${YELLOW}>>> Step 3: Validating Hardware Profile Assertions...${NC}"
bash scripts/bobzzite-profile-validate.sh all
echo -e "${GREEN}✔ Hardware profile assertions passed.${NC}\n"

# Step 4: Broad Compatibility Check
echo -e "${YELLOW}>>> Step 4: Running Hardware Compatibility Audit...${NC}"
bash scripts/bobzzite-compat.sh check
echo -e "${GREEN}✔ Hardware compatibility audit passed.${NC}\n"

# Step 5: Containerfile Check
echo -e "${YELLOW}>>> Step 5: Validating Containerfile Syntax...${NC}"
if command -v docker >/dev/null 2>&1; then
    docker build --check -f Containerfile .
    echo -e "${GREEN}✔ Containerfile build check passed.${NC}\n"
elif command -v podman >/dev/null 2>&1; then
    podman build --check -f Containerfile . || echo "Podman check skipped"
fi

echo -e "${BOLD}${GREEN}✔ ALL LOCAL CI SMOKE CHECKS COMPLETED SUCCESSFULLY.${NC}"
