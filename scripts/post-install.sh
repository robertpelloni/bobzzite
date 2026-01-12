#!/bin/bash
set -euo pipefail

echo "=== bobzzite post-install setup ==="

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing bob ecosystem apps..."

echo "=== Post-install complete ==="
echo "Welcome to bobzzite!"
