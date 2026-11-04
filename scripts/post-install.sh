#!/bin/bash
set -euo pipefail

echo "=== bobzzite post-install setup ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure flathub remote is configured
if command -v flatpak >/dev/null 2>&1; then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
    echo "Flathub remote configured."
else
    echo "Flatpak command not present; skipping flathub addition."
fi

# Run indie developer tools installation script
if [ -f "${SCRIPT_DIR}/install-indie-tools.sh" ]; then
    bash "${SCRIPT_DIR}/install-indie-tools.sh"
fi

# Run Godot 4 & VS Codium integration configuration
if [ -f "${SCRIPT_DIR}/configure-godot-codium.sh" ]; then
    bash "${SCRIPT_DIR}/configure-godot-codium.sh"
fi

echo "=== Post-install complete ==="
echo "Welcome to bobzzite!"
