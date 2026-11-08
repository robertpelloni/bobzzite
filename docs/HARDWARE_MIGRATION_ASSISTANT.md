# Bobzzite OS - Hardware Profile Migration Assistant Guide

The `bobzzite-migrate` utility provides a streamlined, fail-safe assistant for transitioning an existing Bobzzite installation across hardware flavor profiles (e.g., from generic Desktop `bobzzite` to Steam Deck handheld `bobzzite-deck` or high-performance workstation `bobzzite-nvidia`).

## Workflow Overview

When migrating across hardware profiles, the assistant conducts a 4-phase audit:

1. **Hardware Fit & Device Probing**:
   Invokes `bobzzite-deploy detect` to verify PCI vendor/device IDs, CPU architecture (`x86_64` vs `aarch64`), and DMI product strings.
2. **Profile Differential Analysis**:
   Invokes `bobzzite-diff` to compare compositors (KWin vs Gamescope), drivers (Mesa vs NVIDIA proprietary), and audio quantum defaults.
3. **Pre-Rebase Snapshot & State Safety**:
   Validates pinned ostree deployments via `bobzzite-backup` to ensure rollback is preserved.
4. **Atomic Migration Execution**:
   Executes `rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/<flavor>:latest`.

## Usage

```bash
# Run non-destructive pre-flight check and diff against handheld flavor
bobzzite-migrate bobzzite-deck --dry-run

# Execute atomic rebase to NVIDIA workstation flavor
sudo bobzzite-migrate bobzzite-nvidia --apply
```

## Control Center Integration

`bobzzite-migrate` is integrated into the **Hardware & Gaming Profiles** section of the **Bobzzite Control Center** (`bobzzite-control-center`), providing one-click dry-runs and automated migration staging.
