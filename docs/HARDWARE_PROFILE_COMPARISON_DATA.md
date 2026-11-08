# Bobzzite OS - Hardware Profile Comparison Data Matrix (v6.7.0)

This document contains generated side-by-side comparative matrices extracted by `bobzzite-diff` across all supported Bobzzite OS hardware flavors.

## 1. Workstation vs Handheld (`bobzzite` vs `bobzzite-deck`)

| Attribute | `bobzzite` (Desktop Workstation) | `bobzzite-deck` (Handheld Gaming) | Status | Architectural Impact |
| :--- | :--- | :--- | :--- | :--- |
| **`arch`** | `x86_64` | `x86_64` | Identical | Binary compatible |
| **`base_image`** | `ghcr.io/ublue-os/bazzite:latest` | `ghcr.io/ublue-os/bazzite-deck:latest` | Divergent | Includes Gamescope session and Steam Deck DMI hooks |
| **`compositor`** | `kwin_wayland` | `gamescope` | Divergent | Gamepad-centric fullscreen nested Wayland micro-compositor |
| **`hardware_target`** | Standard PC / AMD / Intel Arc | Steam Deck / ROG Ally / Legion Go | Divergent | Handheld power governor & controller mapping |
| **`driver_stack`** | `mesa-radeonsi / iris` | `mesa-radeonsi` | Divergent | Optimized AMD RDNA APU RADV Vulkan stack |
| **`audio_quantum_default`**| `128` | `256` | Divergent | Balanced battery life vs real-time chiptune latency |

---

## 2. Workstation vs High-Performance NVIDIA (`bobzzite` vs `bobzzite-nvidia`)

| Attribute | `bobzzite` (Desktop Workstation) | `bobzzite-nvidia` (NVIDIA Workstation) | Status | Architectural Impact |
| :--- | :--- | :--- | :--- | :--- |
| **`arch`** | `x86_64` | `x86_64` | Identical | Binary compatible |
| **`base_image`** | `ghcr.io/ublue-os/bazzite:latest` | `ghcr.io/ublue-os/bazzite-nvidia:latest` | Divergent | Pre-loaded with open-kernel NVIDIA GPU modules |
| **`compositor`** | `kwin_wayland` | `kwin_wayland` | Identical | Wayland explicit synchronization protocol active |
| **`hardware_target`** | Standard PC / AMD / Intel Arc | NVIDIA RTX GPUs (Ampere / Ada Lovelace) | Divergent | CUDA compute, OptiX denoiser, and NVENC encoding |
| **`driver_stack`** | `mesa-radeonsi / iris` | `nvidia-proprietary-open` | Divergent | Proprietary kernel driver modules & CUDA toolkit |
| **`audio_quantum_default`**| `128` | `128` | Identical | High-performance 128-sample low-latency audio |

---

## 3. Workstation vs ARM64 Embedded / Laptop (`bobzzite` vs `bobzzite-arm64`)

| Attribute | `bobzzite` (Desktop Workstation) | `bobzzite-arm64` (ARM64 SBC & Laptops) | Status | Architectural Impact |
| :--- | :--- | :--- | :--- | :--- |
| **`arch`** | `x86_64` | `aarch64` | Divergent | Requires ARM64 instruction set & multi-arch emulation |
| **`base_image`** | `ghcr.io/ublue-os/bazzite:latest` | `ghcr.io/ublue-os/bazzite-arch:latest` | Divergent | Multi-arch base image supporting aarch64 kernels |
| **`compositor`** | `kwin_wayland` | `kwin_wayland` | Identical | Wayland native rendering |
| **`hardware_target`** | Standard PC / AMD / Intel Arc | Snapdragon X Elite / Rockchip RK3588 | Divergent | High efficiency ARM64 architecture |
| **`driver_stack`** | `mesa-radeonsi / iris` | `panfrost / mesa-freedreno` | Divergent | Open-source mobile GPU driver stack |
| **`audio_quantum_default`**| `128` | `256` | Divergent | Optimized for embedded audio DSP codecs |

---

## 4. Extraction Commands

To regenerate these tables programmatically:

```bash
# Terminal output with ANSI coloring
bobzzite-diff bobzzite bobzzite-deck terminal

# Markdown table output
bobzzite-diff bobzzite bobzzite-nvidia markdown

# Machine-readable JSON diff
bobzzite-diff bobzzite bobzzite-arm64 json
```
