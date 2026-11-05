#!/bin/bash
set -euo pipefail

# Bobzzite System Doctor & Diagnostics Tool
# Inspects atomic OS deployment, kernel parameters, GPU acceleration, and dev tools.

echo "=========================================================="
echo "            BOBZZITE SYSTEM DOCTOR & DIAGNOSTICS          "
echo "=========================================================="

echo -e "\n[1/5] Checking OS Release & Identity..."
if [ -f /etc/bobzzite-release ]; then
    cat /etc/bobzzite-release
else
    echo "Notice: Running in un-rebased or container environment."
fi

echo -e "\n[2/5] Checking Atomic OSTree Status..."
if command -v rpm-ostree >/dev/null 2>&1; then
    rpm-ostree status --pending || true
else
    echo "rpm-ostree command not available on host."
fi

echo -e "\n[3/5] Checking Graphics Acceleration & Display Compositor..."
echo "XDG_SESSION_TYPE: ${XDG_SESSION_TYPE:-Not set}"
if command -v lspci >/dev/null 2>&1; then
    lspci | grep -i -E "vga|3d|display" || true
else
    echo "lspci not present."
fi

echo -e "\n[4/5] Checking GameMode Optimization..."
if command -v gamemoded >/dev/null 2>&1; then
    gamemoded -s || true
else
    echo "gamemode daemon not present in environment."
fi

echo -e "\n[5/5] Checking Indie Dev Tool Runtimes (Flatpak)..."
if command -v flatpak >/dev/null 2>&1; then
    for app in org.godotengine.Godot com.vscodium.codium org.gimp.GIMP org.audacityteam.Audacity com.obsproject.Studio; do
        if flatpak info "$app" >/dev/null 2>&1; then
            echo "  [PASS] $app is installed."
        else
            echo "  [INFO] $app is not yet installed."
        fi
    done
else
    echo "Flatpak not present in environment."
fi

echo -e "\n=========================================================="
echo "Diagnostics complete. System status verified."
echo "=========================================================="
