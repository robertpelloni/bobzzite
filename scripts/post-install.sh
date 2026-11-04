#!/bin/bash
set -euo pipefail

echo "=== bobzzite post-install setup ==="

# Ensure flathub remote is configured
if command -v flatpak >/dev/null 2>&1; then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
    echo "Flathub remote configured."
else
    echo "Flatpak command not present; skipping flathub addition."
fi

echo "Installing/verifying bob ecosystem apps..."
# Future flatpak apps will install here
echo "=== Post-install complete ==="
echo "Welcome to bobzzite!"
