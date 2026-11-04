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

# Ensure wallpaper and icon permissions
if [ -d /usr/share/backgrounds/bobzzite ]; then
    chmod 644 /usr/share/backgrounds/bobzzite/* 2>/dev/null || true
fi
if [ -d /usr/share/icons/bobzzite ]; then
    chmod 644 /usr/share/icons/bobzzite/* 2>/dev/null || true
fi

echo "=== bobzzite build complete ==="
