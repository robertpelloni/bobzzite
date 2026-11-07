# Bobzzite OS Multi-Architecture & ARM64 Build Guide

## Overview

Starting with Milestone 5.0.0, Bobzzite OS introduces formal multi-architecture compilation support across two primary CPU ISAs:
1. **`linux/amd64` (`x86_64`)**: Mainstream desktop workstations, gaming PCs, and handhelds (`bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`).
2. **`linux/arm64` (`aarch64`)**: Power-efficient ARM devices including Qualcomm Snapdragon X Elite laptops, Rockchip RK3588 single-board computers, and Raspberry Pi 5 (`bobzzite-arm64`).

---

## Target Architectures & Driver Stacks

| Flavor | Architecture | GPU Drivers | Hardware Acceleration |
| :--- | :--- | :--- | :--- |
| **`bobzzite`** | `linux/amd64` | Mesa RADV / ANV (ACO) | Vulkan 1.3, VA-API / QSV |
| **`bobzzite-deck`** | `linux/amd64` | Mesa RADV (Custom APU) | Vulkan 1.3, VA-API (RDNA) |
| **`bobzzite-nvidia`** | `linux/amd64` | Proprietary NVIDIA 565+ | Vulkan 1.3, NVENC / CUDA |
| **`bobzzite-arm64`** | `linux/arm64` | Mesa Panfrost / Freedreno | Vulkan 1.3 (PanVK/Turnip), V4L2 M2M |

---

## Cross-Compilation with Docker Buildx & QEMU

To compile ARM64 images on an x86_64 host machine:

```bash
# 1. Register QEMU multi-arch binfmt handlers
docker run --privileged --rm tonistiigi/binfmt --install all

# 2. Inspect multi-architecture targets
bobzzite-build-flavors all multi-arch

# 3. Dry-run verify ARM64 Containerfile configuration
bobzzite-build-flavors bobzzite-arm64 check

# 4. Cross-compile ARM64 container image
bobzzite-build-flavors bobzzite-arm64 build
```
