# Bobzzite OS Hardware Compliance & Quality Assurance Guide

## Overview

Bobzzite OS establishes strict hardware compliance baselines to guarantee zero-latency audio processing, smooth Wayland compositor rendering, native game controller responsiveness, and seamless suspend/resume across desktop, handheld, and discrete NVIDIA workstations.

The `bobzzite-hardware-audit` utility verifies that a target physical or virtual system satisfies the hardware requirements for Bobzzite OS flavors.

---

## The `bobzzite-hardware-audit` Tool

Run `bobzzite-hardware-audit` directly from the terminal or through the **Bobzzite Control Center**:

```bash
# Execute hardware compliance audit
bobzzite-hardware-audit
```

---

## Compliance Audit Checklist

### 1. Form Factor & DMI Signature
- Identifies whether the machine is a desktop, laptop, or specialized gaming handheld (Steam Deck, ASUS ROG Ally, Lenovo Legion Go, AYANEO).
- Automatically pairs the hardware with the corresponding atomic OS flavor (`bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`).

### 2. Microarchitecture & Kernel Layer
- Confirms 64-bit x86_64 architecture with support for AVX2/FMA instructions.
- Verifies modern Linux kernel capabilities (Bazzite custom gaming kernel with fsync / futex2 patches).

### 3. GPU Rendering & Vulkan Compatibility
- Verifies access to Direct Rendering Infrastructure nodes (`/dev/dri/card*` and `/dev/dri/renderD*`).
- Audits Vulkan 1.3 driver compliance (`VK_KHR_dynamic_rendering`, `VK_EXT_descriptor_indexing`).

### 4. Audio Server & Real-Time Low Latency
- Checks for active PipeWire / WirePlumber routing daemons and ALSA hardware sound cards.
- Confirms buffer quantum scaling ability down to 64/128 frames (~1.3ms–2.6ms latency).

### 5. Input Subsystem
- Scans `/dev/input/` event nodes and joysticks (`/dev/input/js*`).
- Confirms Linux evdev subsystem readiness for gamepad mapping and gyro control.
