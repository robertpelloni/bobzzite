#!/bin/bash
set -euo pipefail

echo "=== bobzzite build script ==="

echo "Setting up bobzzite branding..."

if [ -f /usr/lib/os-release ]; then
    sed -i 's/NAME="Bazzite"/NAME="bobzzite"/g' /usr/lib/os-release
    sed -i 's/PRETTY_NAME="Bazzite"/PRETTY_NAME="bobzzite"/g' /usr/lib/os-release
    sed -i 's/ID=bazzite/ID=bobzzite/g' /usr/lib/os-release
fi

echo "=== bobzzite build complete ==="
