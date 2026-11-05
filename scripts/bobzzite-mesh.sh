#!/bin/bash
set -euo pipefail

# Bobzzite Mesh & Multiplayer Collaboration Tool
# Sets up peer-to-peer networking (Tailscale), asset synchronization (Syncthing),
# and Wayland remote application streaming (Waypipe) for bobzzite OS.

echo "=== bobzzite Mesh & Multiplayer Tool ==="

ACTION="${1:-status}"

case "$ACTION" in
    status)
        echo "--- Network & Mesh Status ---"
        if command -v tailscale >/dev/null 2>&1; then
            tailscale status || echo "Tailscale service not connected."
        else
            echo "Tailscale not installed on host."
        fi

        if command -v syncthing >/dev/null 2>&1; then
            systemctl --user is-active syncthing 2>/dev/null || echo "Syncthing user service inactive."
        fi
        ;;
    up)
        echo "Activating mesh networking via Tailscale..."
        if command -v tailscale >/dev/null 2>&1; then
            sudo tailscale up --operator="$USER" || true
        else
            echo "Tailscale command not found."
        fi
        ;;
    sync-enable)
        echo "Enabling Syncthing P2P asset sync service..."
        if command -v syncthing >/dev/null 2>&1; then
            systemctl --user enable --now syncthing || true
            echo "Syncthing active. Access web GUI at http://localhost:8384"
        fi
        ;;
    help|*)
        echo "Usage: bobzzite-mesh [status|up|sync-enable]"
        ;;
esac
