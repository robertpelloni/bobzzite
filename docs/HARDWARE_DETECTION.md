# Bobzzite OS Hardware Detection & Automatic Flavor Selection Guide

## Overview

Bobzzite OS produces three specialized atomic operating system images to support the gaming and indie development ecosystem:
- `bobzzite`: Desktop AMD Radeon and Intel Arc / UHD graphics.
- `bobzzite-deck`: Handheld gaming PCs (Steam Deck LCD / OLED, ASUS ROG Ally, Lenovo Legion Go, AYANEO, GPD Win).
- `bobzzite-nvidia`: Desktop and mobile workstations with NVIDIA GeForce RTX / GTX GPUs utilizing proprietary drivers.

---

## Hardware Probing Architecture: `bobzzite-deploy detect`

The `bobzzite-deploy detect` tool automatically analyzes system DMI product strings and PCI device signatures to identify the ideal image flavor.

```bash
# Probe local hardware and print recommended image flavor
bobzzite-deploy detect
```

### Detection Logic

1. **Handheld Gaming PC Inspection (`/sys/class/dmi/id/product_name`):**
   - Matches `Jupiter` or `Galileo` $\rightarrow$ Valve Steam Deck LCD / OLED.
   - Matches `ROG Ally` $\rightarrow$ ASUS ROG Ally Z1 / Extreme.
   - Matches `Legion Go` $\rightarrow$ Lenovo Legion Go.
   - Matches `AYANEO`, `GPD`, or `ONEXPLAYER` handheld chassis.
   - *Result:* Recommends `bobzzite-deck` (enables Steam Gamepad UI, Gamescope session, TDP controls, and handheld controller glyphs).

2. **Discrete NVIDIA GPU Probe (`lspci -nn`):**
   - Scans PCI classes `0300` (VGA) and `0302` (3D Controller) for vendor ID `10de` (NVIDIA Corporation).
   - *Result:* Recommends `bobzzite-nvidia` (pre-loads proprietary NVIDIA kernel modules, CUDA runtime, and NVENC video hardware encoding).

3. **Fallback Open Source Graphics:**
   - Detects AMD Radeon (`vendor 1002`) or Intel Arc/Iris (`vendor 8086`).
   - *Result:* Recommends standard `bobzzite` (upstream Mesa RADV/ANV Vulkan drivers).
