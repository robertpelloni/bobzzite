# Bobzzite OS Hardware Capabilities & Feature Comparison Matrix

## Overview

Bobzzite OS generates three specialized operating system images to deliver native, zero-compromise performance on gaming handhelds, modern open-source graphics workstations, and discrete NVIDIA rigs.

---

## Detailed Flavor Capability Comparison

| Feature / Subsystem | `bobzzite` (Desktop AMD/Intel) | `bobzzite-deck` (Handheld PCs) | `bobzzite-nvidia` (GeForce GPUs) |
|---|---|---|---|
| **Upstream Base** | `ghcr.io/ublue-os/bazzite` | `ghcr.io/ublue-os/bazzite-deck` | `ghcr.io/ublue-os/bazzite-nvidia` |
| **Default Session** | KDE Plasma 6 (Wayland) | Gamescope (Gamepad UI) + Plasma | KDE Plasma 6 (NVIDIA Wayland/X11) |
| **GPU Driver** | Open-source Mesa (RADV/ANV) | Open-source Mesa (RADV ACO) | NVIDIA Proprietary (550+/565+) |
| **Hardware Video Encoding** | VA-API / QuickSync / AMF | VA-API / AMF (RDNA 2/3) | NVENC (HEVC / AV1 / H.264) |
| **VR DRM Display Lease** | Supported (`wp_drm_lease_device_v1`) | Non-standard (handheld internal) | Supported via NVIDIA Wayland |
| **Gamepad Integration** | Native Linux evdev / SDL2 | Steam Input + Custom Gyro/TDP | Native Linux evdev / SDL2 |
| **Seamless Suspend/Resume** | ACPI S3 / Modern Standby | Instant Steam Deck Sleep | ACPI S3 / PM NV Driver hooks |
| **Sunshine Streaming Host** | VA-API / QuickSync encoder | VA-API hardware encoder | NVENC ultra-low latency encoder |

---

## Command-Line Matrix Inspection

Use `bobzzite-build-flavors all summary` or the **Bobzzite Control Center** to query flavor capabilities directly on the host system:

```bash
bobzzite-build-flavors all summary
```
