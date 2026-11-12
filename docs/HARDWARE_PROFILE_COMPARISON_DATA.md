# Bobzzite OS - Hardware Profile Comparison Data Matrix (v8.9.0)

This document contains generated side-by-side comparative matrices extracted by `bobzzite-diff` across all supported Bobzzite OS hardware flavors.

## 1. Workstation vs Handheld (`bobzzite` vs `bobzzite-deck`)

| Attribute | `bobzzite` (Desktop Workstation) | `bobzzite-deck` (Handheld Gaming) | Status | Architectural Impact |
| :--- | :--- | :--- | :--- | :--- |
| **`arch`** | `linux/amd64` | `linux/amd64` | Identical | Binary compatible across x86_64 host instructions |
| **`base_image`** | `ghcr.io/ublue-os/bazzite:latest` | `ghcr.io/ublue-os/bazzite-deck:latest` | Divergent | Includes Gamescope session and Steam Deck DMI hooks |
| **`compositor`** | `kwin_wayland` | `gamescope` | Divergent | Gamepad-centric fullscreen nested Wayland micro-compositor |
| **`hardware_target`** | Desktop / Laptop AMD Radeon & Intel Arc | Handheld Gaming PCs (Steam Deck, ROG Ally, Legion Go) | Divergent | Handheld power governor, thermal curves, & controller mapping |
| **`driver_stack`** | `Mesa RADV / ANV` | `RADV ACO (AMD Mesa)` | Divergent | Optimized AMD RDNA APU RADV Vulkan stack with ACO compiler |
| **`video_encoders`** | `vaapi`, `qsv`, `amf` | `vaapi`, `amf` | Divergent | Desktop Intel QuickSync + AMD AMF vs Handheld APU encoders |
| **`audio_quantum_default`**| `128` | `256` | Divergent | Balanced battery life vs real-time chiptune audio latency |
| **`prime_offload`** | `DRI_PRIME=1` (Multi-GPU) | Single APU / Integrated | Divergent | Desktop dual-GPU switching vs Handheld unified memory APU |

---

## 2. Workstation vs High-Performance NVIDIA (`bobzzite` vs `bobzzite-nvidia`)

| Attribute | `bobzzite` (Desktop Workstation) | `bobzzite-nvidia` (NVIDIA Workstation) | Status | Architectural Impact |
| :--- | :--- | :--- | :--- | :--- |
| **`arch`** | `linux/amd64` | `linux/amd64` | Identical | Binary compatible across x86_64 host instructions |
| **`base_image`** | `ghcr.io/ublue-os/bazzite:latest` | `ghcr.io/ublue-os/bazzite-nvidia:latest` | Divergent | Pre-loaded with open-kernel NVIDIA GPU modules |
| **`compositor`** | `kwin_wayland` | `kwin_wayland` | Identical | Wayland explicit synchronization protocol active |
| **`hardware_target`** | Desktop / Laptop AMD Radeon & Intel Arc | Workstation / Laptop NVIDIA GeForce RTX/GTX | Divergent | CUDA compute, OptiX denoiser, and NVENC encoding |
| **`driver_stack`** | `Mesa RADV / ANV` | `NVIDIA Proprietary AKMOD` | Divergent | Proprietary kernel driver modules & CUDA toolkit |
| **`video_encoders`** | `vaapi`, `qsv`, `amf` | `nvenc`, `nvdec`, `cuda` | Divergent | Hardware NVENC 8th-Gen Dual Encoders vs Mesa VA-API |
| **`audio_quantum_default`**| `128` | `128` | Identical | High-performance 128-sample low-latency audio |
| **`prime_offload`** | `DRI_PRIME=1` | `__NV_PRIME_RENDER_OFFLOAD=1` | Divergent | Dynamic GLX/Vulkan vendor dispatch to discrete RTX |

---

## 3. Workstation vs ARM64 Embedded / Laptop (`bobzzite` vs `bobzzite-arm64`)

| Attribute | `bobzzite` (Desktop Workstation) | `bobzzite-arm64` (ARM64 SBC & Laptops) | Status | Architectural Impact |
| :--- | :--- | :--- | :--- | :--- |
| **`arch`** | `linux/amd64` | `linux/arm64` | Divergent | Requires ARM64 instruction set & multi-arch emulation |
| **`base_image`** | `ghcr.io/ublue-os/bazzite:latest` | `ghcr.io/ublue-os/bazzite:latest` | Identical | Layered on upstream multi-arch Bazzite image |
| **`compositor`** | `kwin_wayland` | `kwin_wayland` | Identical | Wayland native desktop session rendering |
| **`hardware_target`** | Desktop / Laptop AMD Radeon & Intel Arc | ARM64 SBCs & Snapdragon X Elite Laptops | Divergent | High efficiency ARM64 architecture |
| **`driver_stack`** | `Mesa RADV / ANV` | `Mesa Panfrost / Freedreno (Turnip)` | Divergent | Open-source mobile GPU driver stack |
| **`video_encoders`** | `vaapi`, `qsv`, `amf` | `v4l2m2m`, `vaapi` | Divergent | Video4Linux2 memory-to-memory hardware codecs |
| **`audio_quantum_default`**| `128` | `256` | Divergent | Optimized for embedded audio DSP codecs |
| **`prime_offload`** | `DRI_PRIME=1` | SoC Unified Architecture | Divergent | Integrated Adreno / Mali unified memory architecture |

---

## 4. Extraction & Validation Commands

To regenerate these comparative matrices programmatically:

```bash
# Terminal output with ANSI coloring
bobzzite-diff bobzzite bobzzite-deck terminal

# Markdown table output
bobzzite-diff bobzzite bobzzite-nvidia markdown

# Machine-readable JSON diff
bobzzite-diff bobzzite bobzzite-arm64 json
```
