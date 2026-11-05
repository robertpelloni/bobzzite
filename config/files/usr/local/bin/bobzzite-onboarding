#!/bin/bash
set -euo pipefail

# Bobzzite First-Boot Onboarding Wizard
# Greets the user, ensures essential directories exist, and launches Control Center

ONBOARDING_FLAG="${HOME}/.config/bobzzite-onboarded"

if [ -f "${ONBOARDING_FLAG}" ]; then
    exit 0
fi

echo "=========================================================="
echo "           WELCOME TO BOBZZITE GAMING OS!                 "
echo "=========================================================="
echo "Configuring initial user environment..."

mkdir -p "${HOME}/Games" "${HOME}/Templates" "${HOME}/Projects"

# Offer option to launch Control Center or run full provisioning
if command -v bobzzite-control-center >/dev/null 2>&1; then
    echo "Launching Bobzzite Control Center..."
    nohup bobzzite-control-center >/dev/null 2>&1 &
fi

# Touch flag so it does not pop up on subsequent reboots unless manually triggered
touch "${ONBOARDING_FLAG}"
echo "Onboarding completed successfully. Have fun developing and gaming!"
