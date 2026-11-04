#!/bin/bash
set -euo pipefail

# Indie Game Development Tools Installer for bobzzite
# Installs Godot, VSCodium, GIMP, Audacity, and OBS Studio via Flatpak

echo "=== Installing Indie Development Tools for bobzzite ==="

if ! command -v flatpak >/dev/null 2>&1; then
    echo "Warning: 'flatpak' command not found. Skipping tool installation."
    exit 0
fi

# Ensure Flathub is added
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

INDIE_TOOLS=(
    "org.godotengine.Godot"
    "com.vscodium.codium"
    "org.gimp.GIMP"
    "org.audacityteam.Audacity"
    "com.obsproject.Studio"
)

for app in "${INDIE_TOOLS[@]}"; do
    echo "Installing $app..."
    flatpak install -y --noninteractive flathub "$app" || {
        echo "Warning: Failed to install $app, continuing..."
    }
done

echo "=== Indie Development Tools installation finished ==="
