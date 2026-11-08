# Bobzzite OS - Hardware Deployment & Rebase Workflows

This document outlines end-to-end operational runbooks for system administrators, QA engineers, and indie playtesters switching hardware environments or staging production images.

## Runbook 1: Migrating from Generic Workstation to Steam Deck Handheld

```bash
# 1. Inspect host DMI string to ensure handheld detection triggers
bobzzite-deploy detect

# 2. Run fit analysis (Expect 100% fit on handhelds)
bobzzite-deploy profile-analyze

# 3. Review differential impacts (KWin -> Gamescope, Mesa RADV optimizations)
bobzzite-deploy profile-compare bobzzite bobzzite-deck

# 4. Perform pre-rebase config backup
bobzzite-backup create "pre-deck-migration"

# 5. Execute atomic rebase
sudo bobzzite-deploy bobzzite-deck

# 6. Reboot into Gamescope session
sudo systemctl reboot
```

## Runbook 2: Migrating to NVIDIA Workstation for CUDA/OptiX 3D Baking

```bash
# 1. Validate discrete GPU presence and target profile assertions
bobzzite-deploy profile-validate bobzzite-nvidia

# 2. Audit hardware compliance for display leasing and driver layers
bobzzite-deploy profile-audit

# 3. Execute atomic rebase to NVIDIA image flavor
sudo bobzzite-deploy bobzzite-nvidia

# 4. Reboot system and verify driver initialization
sudo systemctl reboot
```

## Runbook 3: Air-Gapped / Offline Local OCI Archive Deployment

```bash
# 1. Export local container image tarball
podman save -o /var/tmp/bobzzite-deck.tar.gz ghcr.io/robertpelloni/bobzzite-deck:latest

# 2. Rebase ostree using local unverified archive transport
sudo bobzzite-deploy bobzzite-deck oci-archive

# 3. Reboot into new image
sudo systemctl reboot
```
