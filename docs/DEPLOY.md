# Bobzzite OS - Deployment and Rebase Guide

## Overview

Bobzzite is distributed as an atomic OCI container image built on Fedora Silverblue via Universal Blue (`bazzite`). Deployments and upgrades are handled cleanly using `rpm-ostree`.

---

## Hardware Target Detection & Assisted Rebase

Bobzzite includes the `bobzzite-deploy` utility (`scripts/bobzzite-deploy.sh`), which probes physical hardware signatures via DMI and PCI device tables:

```bash
# Detect hardware and print recommended flavor
bobzzite-deploy detect

# Automated interactive rebase to recommended flavor
bobzzite-deploy auto-rebase
```

### Hardware Flavor Routing

1. **Handheld Devices (`bobzzite-deck`)**:
   - Matches DMI product names containing: `Jupiter` (Steam Deck LCD), `Galileo` (Steam Deck OLED), `ROG Ally`, `Legion Go`, or `AYANEO`.
   - Rebase command:
     ```bash
     rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite-deck:latest
     ```

2. **NVIDIA Systems (`bobzzite-nvidia`)**:
   - Matches PCI display controllers from vendor `10de` (NVIDIA Corporation).
   - Rebase command:
     ```bash
     rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite-nvidia:latest
     ```

3. **AMD / Intel Systems (`bobzzite`)**:
   - Default target for all other AMD Radeon or Intel Arc / UHD configurations.
   - Rebase command:
     ```bash
     rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
     ```

---

## Local & Offline OCI Archive Deployment

To deploy Bobzzite in air-gapped or offline development environments:

```bash
# 1. Export OCI image archive from build machine
bobzzite-build-flavors bobzzite-deck export-tar

# 2. Rebase target machine to local OCI archive
bobzzite-deploy local-archive /tmp/bobzzite-flavors/bobzzite-deck.tar.gz
```
