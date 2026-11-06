# Bobzzite OS Deployment Guide

## Overview

Bobzzite OS images are published as OCI containers via GitHub Packages (GHCR) and can be deployed directly onto existing Fedora Atomic (Silverblue, Kinoite, Bazzite) installations, or via bootable ISO media.

---

## Deployment Flavors

| Flavor | Target Architecture / Hardware | Registry Tag |
|---|---|---|
| `bobzzite` | AMD Radeon & Intel Arc / UHD Graphics | `ghcr.io/robertpelloni/bobzzite:latest` |
| `bobzzite-deck` | Valve Steam Deck (LCD/OLED), ROG Ally, Legion Go | `ghcr.io/robertpelloni/bobzzite-deck:latest` |
| `bobzzite-nvidia` | NVIDIA GeForce RTX/GTX Desktop & Laptop GPUs | `ghcr.io/robertpelloni/bobzzite-nvidia:latest` |

---

## Deployment & Rebase Automation: `bobzzite-deploy`

The `bobzzite-deploy` utility automates deployment inspection and seamless switching between hardware flavors.

```bash
# 1. Query current ostree deployment and status
bobzzite-deploy status

# 2. Rebase host to Desktop AMD/Intel flavor
bobzzite-deploy bobzzite registry

# 3. Rebase host to Steam Deck handheld flavor
bobzzite-deploy bobzzite-deck registry

# 4. Rebase host to NVIDIA proprietary driver flavor
bobzzite-deploy bobzzite-nvidia registry
```

---

## Air-Gapped / Offline USB Deployment

For testing or air-gapped machine setups without continuous internet access:

1. **Export Local OCI Archive:**
   ```bash
   ./scripts/build-flavors.sh bobzzite export-tar
   # Outputs /tmp/bobzzite-flavors/bobzzite.tar.gz
   ```

2. **Copy Archive to Target Machine:**
   Transfer `bobzzite.tar.gz` to `/var/tmp/bobzzite.tar.gz` on the target system.

3. **Execute Offline Rebase:**
   ```bash
   bobzzite-deploy bobzzite oci-archive
   ```
   Or directly via `rpm-ostree`:
   ```bash
   sudo rpm-ostree rebase ostree-unverified-image:oci-archive:/var/tmp/bobzzite.tar.gz
   ```

4. **Reboot to Complete Deployment:**
   ```bash
   systemctl reboot
   ```

---

## Rollback & Recovery

If an issue is detected after rebasing, immediately revert to the prior pinned or active deployment:

```bash
bobzzite-backup rollback
```
