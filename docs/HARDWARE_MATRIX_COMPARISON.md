# Bobzzite OS Hardware Matrix Comparison & Profiler Integration Guide

## Overview

Bobzzite OS supports three distinct target hardware profiles tailored for modern game developers and handheld gamers:
1. **`bobzzite`**: Standard desktop and laptop systems equipped with AMD Radeon (RX 5000–7000) or Intel Arc / Iris Xe graphics.
2. **`bobzzite-deck`**: Handheld gaming consoles including the Steam Deck (LCD/OLED), ASUS ROG Ally, Lenovo Legion Go, and AYANEO devices.
3. **`bobzzite-nvidia`**: High-performance workstations and creator laptops utilizing NVIDIA GeForce RTX/GTX GPUs with proprietary drivers.

---

## Comparison Matrix

| Attribute | bobzzite (Desktop) | bobzzite-deck (Handheld) | bobzzite-nvidia (RTX/GTX) |
| :--- | :--- | :--- | :--- |
| **Upstream Base** | `bazzite:latest` | `bazzite-deck:latest` | `bazzite-nvidia:latest` |
| **Primary Compositor** | KWin Wayland (KDE Plasma 6) | Gamescope Gamepad UI + KWin | KWin Wayland (KDE Plasma 6) |
| **Driver Stack** | Mesa RADV / ANV (ACO) | Mesa RADV (Custom APU ACO) | NVIDIA 565+ (AKMOD Kernel) |
| **Video Hardware Encoders** | VA-API / AMF / QuickSync | VA-API / AMF (RDNA 2/3) | NVENC / NVDEC / Optical Flow |
| **Display Leasing** | Wayland DRM Display Leasing | Native Gamescope DRM Leasing | NVIDIA DRM KMS Display Lease |
| **Audio Quantum Buffer** | 128 frames (~2.9ms latency) | 256 frames (~5.8ms latency) | 128 frames (~2.9ms latency) |
| **Power Management** | `power-profiles-daemon` | Handheld Daemon (Custom TDP) | `nvidia-powerd` + PPD |

---

## CLI Profiler Commands

### Side-by-Side Comparison
```bash
# Print formatted comparison table
bobzzite-build-flavors all compare
```

### JSON Profile Export
```bash
# Export machine-readable profile for CI/CD or local automation
bobzzite-build-flavors bobzzite-deck export-profile
cat /tmp/bobzzite-flavors/bobzzite-deck-profile.json
```

---

## JSON Profile Schema

```json
{
  "flavor": "bobzzite-deck",
  "version": "4.4.0",
  "base_image": "ghcr.io/ublue-os/bazzite-deck:latest",
  "compositor": "gamescope",
  "hardware_target": "Handheld Gaming PCs (Steam Deck, ROG Ally, Legion Go)",
  "driver_stack": "RADV ACO (AMD Mesa)",
  "video_encoders": ["vaapi", "amf"],
  "audio_quantum_default": 256
}
```

---

## Integration with Bobzzite Control Center

The **Bobzzite Control Center** exposes direct buttons for both flavor profile inspection and side-by-side comparison under the **Hardware Flavors** card:
- **Inspect**: Run deep diagnostic inspection on target flavors.
- **Compare**: Generate the side-by-side capability matrix in real time.
