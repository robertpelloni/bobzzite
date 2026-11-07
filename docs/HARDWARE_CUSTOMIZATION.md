# Bobzzite OS Hardware Flavor Customization Guide

## Overview

Bobzzite OS supports deep customization of build arguments, compositor runtime parameters, and driver stacks per hardware flavor.

Using `scripts/build-flavors.sh <flavor> config`, developers and system integrators can inspect and generate dynamic `.flavor-config.env` files to fine-tune image layers.

---

## The Flavor Configuration Generator

```bash
# Generate build configuration for Steam Deck / handheld tier
./scripts/build-flavors.sh bobzzite-deck config

# Generate build configuration for Desktop NVIDIA GPU tier
./scripts/build-flavors.sh bobzzite-nvidia config

# Generate build configuration for Desktop AMD / Intel tier
./scripts/build-flavors.sh bobzzite config
```

### Configurable Environmental Variables

| Variable | Description | Example Values |
|---|---|---|
| `BOBZZITE_TARGET_FLAVOR` | Image flavor tag identifier | `bobzzite`, `bobzzite-deck`, `bobzzite-nvidia` |
| `BOBZZITE_BASE_IMAGE` | Upstream Universal Blue / Bazzite base | `ghcr.io/ublue-os/bazzite-deck:latest` |
| `BOBZZITE_COMPOSITOR` | Default session compositor | `gamescope` (handhelds) or `kwin_wayland` (desktop) |
| `BOBZZITE_DRIVER_STACK` | Active GPU driver and shader compiler | `mesa-radv-aco`, `nvidia-proprietary-akmod` |

---

## Customizing Kernel Boot Parameters

For specialized hardware deployments, add custom kernel arguments via `rpm-ostree`:

```bash
# Handhelds: Lock C-States or adjust split-lock mitigation
rpm-ostree kargs --append="split_lock_mitigate=0"

# NVIDIA: Force early KMS modesetting
rpm-ostree kargs --append="nvidia-drm.modeset=1"
```
