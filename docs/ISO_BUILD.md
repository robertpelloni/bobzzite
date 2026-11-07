# Bobzzite OS Bootable ISO Generation Guide

## Overview

Bobzzite OS can be packaged into a bootable offline installation ISO using the **Universal Blue isogenerator** container pipeline.

This produces a hybrid UEFI/BIOS bootable `.iso` containing the Anaconda graphical installer configured to install the chosen Bobzzite flavor directly onto physical NVMe, SSD, or external USB storage.

---

## Generating Bootable Media: `bobzzite-iso`

Run `bobzzite-iso` or trigger the generator from the **Bobzzite Control Center**:

```bash
# 1. Generate ISO builder for standard desktop AMD/Intel flavor
bobzzite-iso bobzzite ~/Builds/ISO

# 2. Generate ISO builder for Steam Deck / Handheld PC flavor
bobzzite-iso bobzzite-deck ~/Builds/ISO

# 3. Generate ISO builder for Desktop NVIDIA GPU flavor
bobzzite-iso bobzzite-nvidia ~/Builds/ISO
```

---

## Building the ISO with Podman or Docker

Execute the generated script or run the container generator directly:

```bash
sudo podman run --rm --privileged \
     -v ~/Builds/ISO:/build-container-installer/build \
     ghcr.io/ublue-os/isogenerator:latest \
     ghcr.io/robertpelloni/bobzzite:latest
```

### Build Artifacts
- Bootable ISO: `~/Builds/ISO/bobzzite-latest.iso`
- SHA256 Checksum: `~/Builds/ISO/bobzzite-latest.iso-CHECKSUM`

---

## Flashing ISO to USB Installation Media

### Using `dd` on Linux:
```bash
sudo dd if=~/Builds/ISO/bobzzite-latest.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

### Using Ventoy:
Simply copy `bobzzite-latest.iso` onto your Ventoy-formatted USB drive.
