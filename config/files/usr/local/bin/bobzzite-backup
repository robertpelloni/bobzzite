#!/bin/bash
set -euo pipefail

# Bobzzite Backup, Rollback & Snapshot Utility
# Manages rpm-ostree deployment pinning and user game dev snapshots.

echo "=== bobzzite Backup & Snapshot Utility ==="

ACTION="${1:-status}"
BACKUP_DIR="${HOME}/.bobzzite-backups"

case "$ACTION" in
    status)
        echo "--- Active Ostree Deployments ---"
        if command -v rpm-ostree >/dev/null 2>&1; then
            rpm-ostree status || true
        else
            echo "rpm-ostree not available on host."
        fi
        echo -e "\n--- Saved User Snapshots in ${BACKUP_DIR} ---"
        if [ -d "${BACKUP_DIR}" ]; then
            ls -lh "${BACKUP_DIR}"
        else
            echo "No backups created yet."
        fi
        ;;
    pin)
        echo "Pinning active deployment to prevent auto-pruning..."
        if command -v ostree >/dev/null 2>&1; then
            sudo ostree admin pin 0 || echo "Failed to pin deployment."
        fi
        ;;
    backup-user)
        echo "Creating snapshot of user configs & dev templates..."
        mkdir -p "${BACKUP_DIR}"
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        ARCHIVE="${BACKUP_DIR}/user_snapshot_${TIMESTAMP}.tar.gz"
        tar -czf "${ARCHIVE}" \
            -C "${HOME}" \
            --exclude=".cache" \
            --exclude="*.iso" \
            .config/godot \
            .var/app/com.vscodium.codium \
            Templates \
            2>/dev/null || true
        echo "Snapshot saved to: ${ARCHIVE}"
        ;;
    rollback)
        echo "Initiating system atomic rollback..."
        if command -v rpm-ostree >/dev/null 2>&1; then
            rpm-ostree rollback || true
            echo "Rollback staged. Please reboot your system (systemctl reboot)."
        fi
        ;;
    help|*)
        echo "Usage: bobzzite-backup [status|pin|backup-user|rollback]"
        ;;
esac
