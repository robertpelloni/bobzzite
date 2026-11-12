# Bobzzite OS Broad Hardware Compatibility Matrix Guide

## Overview

Bobzzite OS delivers high-performance indie game development and gaming environments across modern and legacy personal computers, handhelds, and workstations.

The `bobzzite-compat` utility (`scripts/bobzzite-compat.sh`) audits processor instruction sets, GPU rendering backends, input event permissions, and low-latency audio buffer capabilities.

---

## Hardware Compatibility Tiers

### Tier 1: Fully Compatible & Recommended
- **Processors:** AMD Zen 2–Zen 5, Intel 10th–14th Gen Core, Intel Core Ultra.
- **Graphics:**
  - AMD Radeon RX 5000–7000 Series (RADV ACO Vulkan 1.3).
  - Intel Arc A-Series & Xe Graphics (ANV Vulkan 1.3).
  - NVIDIA GeForce RTX 20/30/40 Series (565+ AKMOD Drivers).
- **Handheld APUs:** Custom AMD Aerith/Sephiroth (Steam Deck), AMD Ryzen Z1 Extreme (ROG Ally, Legion Go).
- **Features:** Hardware raytracing, AVX2 compute, VA-API/NVENC 4K60 video streaming, sub-3ms PipeWire audio.

### Tier 2: Standard Compatibility (Fallback & Compatibility Modes)
- **Processors:** AMD Zen 1, Intel 7th–9th Gen Core (SSE 4.2, AVX).
- **Graphics:** AMD Polaris / Vega (RX 400/500), NVIDIA GeForce GTX 10xx / 16xx Series.
- **Features:** Full 1080p game development, Godot 4 Compatibility (GLES3/OpenGL), standard 128/256 buffer PipeWire audio.

### Tier 3: Legacy / Limited Compatibility
- **Processors:** Older x86_64 CPUs lacking AVX2 or SSE 4.2.
- **Graphics:** Legacy Intel HD Graphics (Gen7/Gen8) or pre-Polaris AMD.
- **Features:** 2D pixel art development in Aseprite and Godot 3/4 GLES3 mode.

---

## CLI Compatibility Auditor

```bash
# Run full hardware compatibility audit
bobzzite-compat check

# Display system tier classification
bobzzite-compat tier
```
