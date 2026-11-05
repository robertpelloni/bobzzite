# bobzzite System Backup, Snapshots & Rollback Guide

bobzzite provides atomic rollback guarantees for base OS deployments and snapshot tools for game development assets.

---

## 1. Operating System Atomic Rollback

Because bobzzite is an immutable OSTree system, every OS update is prepared as an atomic staging tree:

```bash
# Check current deployments
bobzzite-backup status

# Pin the current known-good deployment so it is never pruned
bobzzite-backup pin

# Rollback to the previous deployment
bobzzite-backup rollback
systemctl reboot
```

---

## 2. User Data & Game Dev Project Snapshots

To take a snapshot of Godot editor settings, VS Codium configurations, and game templates:

```bash
bobzzite-backup backup-user
```

Snapshots are stored in `~/.bobzzite-backups/` as compressed `.tar.gz` archives.

---

## 3. Restoring a User Snapshot

```bash
tar -xzf ~/.bobzzite-backups/user_snapshot_<TIMESTAMP>.tar.gz -C "$HOME"
```
