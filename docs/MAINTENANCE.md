# Bobzzite OS Storage & Maintenance Guide

## Overview

Bobzzite OS is an immutable Linux workstation for game developers and digital artists. While the underlying operating system image (`ostree`) is strictly read-only and updated atomically, user data and application state live inside writable partitions (`/var` and `/home`).

Over time, game development assets, engine shader caches, compiler build outputs, and Flatpak runtimes consume storage. `bobzzite-clean` provides an automated, non-destructive maintenance pipeline to keep handhelds (such as the Steam Deck 64GB/256GB models) and workstations lean and responsive.

---

## The `bobzzite-clean` Utility

Run `bobzzite-clean` directly from the terminal or trigger it from the **Bobzzite Control Center** under the **System Actions** panel.

```bash
# Terminal invocation
bobzzite-clean
```

### What `bobzzite-clean` Cleans Safely:

1. **Unused Flatpak Runtimes & Cache:**
   - Evaluates all installed Flatpak runtimes (GNOME SDKs, Freedesktop runtimes) and removes any versions no longer required by installed applications (`flatpak uninstall --unused -y`).
   - Cleans application temporary cache directories in `~/.var/app/*/cache/*`.

2. **Package Manager & Language Toolchain Caches:**
   - Clears stale caches in `~/.cache/pip/`, `~/.npm/_cacache/`, and `~/.cargo/registry/cache/`.

3. **Desktop & Windowing Caches:**
   - Safely cleans stale thumbnail caches in `~/.cache/thumbnails/`.
   - Clears crashpad dumps in `~/.cache/crashpad/`.
   - Empties the user desktop trash folder (`~/.local/share/Trash/*`).

4. **Systemd Journal Logs:**
   - Vacuums systemd journal logs to retain the last 3 days of diagnostic logs, preventing unbounded journal growth (`journalctl --vacuum-time=3d`).

---

## Ostree Deployment Pruning

Bobzzite OS keeps prior boot deployments for seamless rollbacks. If storage is constrained, older pinned or unpinned deployments can be inspected with:

```bash
# List available system deployments
rpm-ostree status

# Prune unreferenced ostree objects
sudo ostree prune --refs-only
```

---

## Best Practices for Handheld Developers (Steam Deck & ROG Ally)

1. **Store Project Repositories on MicroSD / External SSD:**
   - Format external storage cards as `ext4` or `btrfs` to support symlinks and POSIX permissions required by Godot and Rust.
2. **Periodic Maintenance:**
   - Run `bobzzite-clean` before building large release binaries or creating system snapshots with `bobzzite-backup`.
