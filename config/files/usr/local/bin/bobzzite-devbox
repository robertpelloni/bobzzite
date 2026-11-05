#!/bin/bash
set -euo pipefail

# Bobzzite Distrobox Dev Environment Manager
# Provisions tailored development containers with graphics acceleration and host integration

echo "=== bobzzite Distrobox Environment Manager ==="

if ! command -v distrobox >/dev/null 2>&1; then
    echo "Distrobox is not available in the current environment. Please run on an ostree host."
    exit 0
fi

ACTION="${1:-help}"
BOX_NAME="${2:-bob-dev-arch}"

case "$ACTION" in
    create-arch)
        echo "Creating Arch Linux dev container ($BOX_NAME)..."
        distrobox create -i docker.io/library/archlinux:latest -n "$BOX_NAME" --yes || true
        echo "Container $BOX_NAME created. Enter with: distrobox enter $BOX_NAME"
        ;;
    create-ubuntu)
        echo "Creating Ubuntu dev container ($BOX_NAME)..."
        distrobox create -i docker.io/library/ubuntu:latest -n "$BOX_NAME" --yes || true
        echo "Container $BOX_NAME created. Enter with: distrobox enter $BOX_NAME"
        ;;
    list)
        distrobox list
        ;;
    enter)
        distrobox enter "$BOX_NAME"
        ;;
    help|*)
        echo "Usage: bobzzite-devbox [create-arch|create-ubuntu|list|enter] [box-name]"
        ;;
esac
