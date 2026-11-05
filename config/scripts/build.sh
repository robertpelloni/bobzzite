#!/bin/bash
set -euo pipefail

echo "=== bobzzite build script ==="

echo "Setting up bobzzite branding and os-release identification..."

if [ -f /usr/lib/os-release ]; then
    sed -i 's/^NAME=.*/NAME="bobzzite"/' /usr/lib/os-release
    sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="bobzzite (Bazzite Gaming Edition)"/' /usr/lib/os-release
    sed -i 's/^ID=.*/ID=bobzzite/' /usr/lib/os-release
    sed -i 's/^ID_LIKE=.*/ID_LIKE="bazzite fedora"/' /usr/lib/os-release
fi

if [ -f /etc/bobzzite-release ]; then
    echo "Found /etc/bobzzite-release metadata:"
    cat /etc/bobzzite-release
fi

# Ensure wallpaper, icon, and plymouth permissions
if [ -d /usr/share/backgrounds/bobzzite ]; then
    chmod 644 /usr/share/backgrounds/bobzzite/* 2>/dev/null || true
fi
if [ -d /usr/share/icons/bobzzite ]; then
    chmod 644 /usr/share/icons/bobzzite/* 2>/dev/null || true
fi
if [ -d /usr/share/plymouth/themes/bobzzite ]; then
    chmod 644 /usr/share/plymouth/themes/bobzzite/* 2>/dev/null || true
    if command -v plymouth-set-default-theme >/dev/null 2>&1; then
        echo "Setting default Plymouth boot theme to bobzzite..."
        plymouth-set-default-theme bobzzite || true
    fi
fi
if [ -d /usr/share/sddm/themes/bobzzite ]; then
    chmod -R 644 /usr/share/sddm/themes/bobzzite/* 2>/dev/null || true
fi
if [ -d /usr/share/sounds/bobzzite ]; then
    chmod -R 644 /usr/share/sounds/bobzzite/* 2>/dev/null || true
fi

echo "=== bobzzite build complete ==="
