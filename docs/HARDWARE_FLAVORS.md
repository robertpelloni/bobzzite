# Bobzzite OS - Hardware Target Flavors Guide

## Overview

Bobzzite OS is available in three distinct hardware-optimized container image flavors:

1. **`bobzzite` (Desktop AMD / Intel)**:
   - Optimized for mainstream and high-end desktop PCs and laptops with AMD Radeon (RX 5000–7000) or Intel Arc / Iris Xe graphics.
   - Built on `ghcr.io/ublue-os/bazzite:latest`.
   - Default environment: KDE Plasma 6 (Wayland session).
   - Audio buffer default: 128 frames (2.9ms latency).

2. **`bobzzite-deck` (Handheld PCs)**:
   - Tailored specifically for gaming handhelds including Steam Deck (LCD & OLED), ASUS ROG Ally, Lenovo Legion Go, and AYANEO devices.
   - Built on `ghcr.io/ublue-os/bazzite-deck:latest`.
   - Default environment: Steam Gamepad UI inside Gamescope compositor + KDE Plasma Wayland desktop mode.
   - Handheld features: Dedicated TDP adjustment daemon, gyro/touchscreen calibration, and sleep/wake suspend optimization.
   - Audio buffer default: 256 frames (5.8ms latency).

3. **`bobzzite-nvidia` (GeForce Desktops & Laptops)**:
   - Designed for creator laptops and workstations utilizing NVIDIA GeForce RTX 20/30/40 and GTX 16xx series GPUs.
   - Built on `ghcr.io/ublue-os/bazzite-nvidia:latest`.
   - Pre-installed proprietary NVIDIA 565+ kernel drivers (AKMOD), NVENC/NVDEC hardware acceleration, CUDA compute runtimes, and Wayland DRM display leasing.
   - Audio buffer default: 128 frames (2.9ms latency).

---

## Hardware Configuration Matrix

| Attribute | `bobzzite` | `bobzzite-deck` | `bobzzite-nvidia` |
| :--- | :--- | :--- | :--- |
| **Target Architecture** | x86_64 Desktop / Laptop | x86_64 Handheld APU | x86_64 Workstation |
| **GPU Vendor** | AMD Radeon / Intel Arc | AMD Custom APU (Van Gogh / Z1) | NVIDIA GeForce |
| **Display Server** | Wayland (KWin) | Gamescope (Steam UI) + KWin | Wayland (KWin) |
| **Kernel Parameters** | `quiet splash mitigations=auto` | `amd_pstate=active quiet splash` | `nvidia_drm.modeset=1 quiet splash` |
| **Hardware Encoders** | VA-API, AMF, QuickSync | VA-API, AMF (RDNA 2/3) | NVENC, NVDEC, Optical Flow |
| **Display Leasing** | Wayland DRM Display Leasing | Native Gamescope DRM Leasing | NVIDIA DRM KMS Display Lease |

---

## Build Automation Engine

The Bobzzite multi-hardware build automation engine is located in `scripts/build-flavors.sh` (mirrored to `bobzzite-build-flavors` and `bobzzite-flavors`):

```bash
# Verify Containerfile syntax and base arguments for all flavors
bobzzite-build-flavors all check

# Print side-by-side comparison matrix
bobzzite-build-flavors all compare

# Deep telemetry inspection across all flavors
bobzzite-build-flavors all inspect

# Build container images locally
bobzzite-build-flavors all build
```
