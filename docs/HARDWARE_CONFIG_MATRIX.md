# Bobzzite OS Hardware Configuration Matrix

## Overview

This specification details the kernel parameters, driver stacks, compositors, display leasing capabilities, and video encoding pipelines configured across the three supported Bobzzite OS hardware flavors.

---

## Detailed Hardware Flavor Specifications

### 1. `bobzzite` (Desktop AMD Radeon & Intel Arc)
- **Target Systems:** Custom gaming desktops, Intel NUCs, ThinkPads, Framework laptops.
- **Base Container Image:** `ghcr.io/ublue-os/bazzite:latest`
- **Session Manager:** SDDM (Bobzzite Greeter Theme)
- **Compositor:** KDE Plasma 6 (KWin Wayland)
- **Kernel Command Line:** `quiet splash mitigations=auto rd.driver.pre=amdgpu`
- **Graphics Driver Stack:**
  - AMD: Mesa RADV with ACO compiler, Vulkan 1.3
  - Intel: Mesa ANV with Iris gallium driver, Vulkan 1.3
- **Hardware Encoders:** VA-API (`/dev/dri/renderD128`), Intel QuickSync, AMD AMF
- **Audio Quantum Presets:** 64, 128 (default), 256, 512 frames @ 48kHz

### 2. `bobzzite-deck` (Handheld APUs)
- **Target Systems:** Steam Deck (LCD & OLED), ASUS ROG Ally, Lenovo Legion Go, AYANEO.
- **Base Container Image:** `ghcr.io/ublue-os/bazzite-deck:latest`
- **Session Manager:** Gamescope Session (Steam Gamepad UI) + SDDM Plasma Desktop Switcher
- **Compositor:** Gamescope (embedded Wayland compositor)
- **Kernel Command Line:** `amd_pstate=active quiet splash video=eDP-1:panel_orientation=right_side_up`
- **Graphics Driver Stack:**
  - AMD Van Gogh (Custom Aerith / Sephiroth APU) / AMD Ryzen Z1 Extreme
  - Mesa RADV ACO tuned for handheld power targets (4W–30W)
- **Hardware Encoders:** VA-API (RDNA 2/3 hardware VCN)
- **Audio Quantum Presets:** 256 frames (default) @ 48kHz

### 3. `bobzzite-nvidia` (GeForce Workstations)
- **Target Systems:** Desktop and laptop workstations equipped with GeForce RTX 20/30/40 & GTX 16xx series GPUs.
- **Base Container Image:** `ghcr.io/ublue-os/bazzite-nvidia:latest`
- **Session Manager:** SDDM (Bobzzite Greeter Theme)
- **Compositor:** KDE Plasma 6 (KWin Wayland)
- **Kernel Command Line:** `nvidia_drm.modeset=1 nvidia_drm.fbdev=1 quiet splash`
- **Graphics Driver Stack:**
  - Proprietary NVIDIA 565+ driver via AKMOD kernel modules
  - NVIDIA Vulkan ICD + CUDA 12 Compute Runtime
- **Hardware Encoders:** NVENC / NVDEC with Optical Flow SDK
- **Audio Quantum Presets:** 128 frames (default) @ 48kHz
