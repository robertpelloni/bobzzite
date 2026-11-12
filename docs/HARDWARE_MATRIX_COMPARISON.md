# Bobzzite OS Hardware Matrix Comparison & Profiler Integration Guide (v9.0.0 Milestone)

## Overview

Bobzzite OS supports four distinct target hardware profiles tailored for modern game developers, creator workstations, handheld gamers, and ARM64 single-board systems:
1. **`bobzzite`**: Standard desktop and laptop systems equipped with AMD Radeon (RX 5000–7000) or Intel Arc / Iris Xe graphics.
2. **`bobzzite-deck`**: Handheld gaming consoles including the Steam Deck (LCD/OLED), ASUS ROG Ally, Lenovo Legion Go, and AYANEO devices.
3. **`bobzzite-nvidia`**: High-performance workstations and creator laptops utilizing NVIDIA GeForce RTX/GTX GPUs with proprietary drivers.
4. **`bobzzite-arm64`**: Power-efficient ARM64 laptops (Snapdragon X Elite) and development SBCs (Rockchip RK3588).

---

## Master Capability Comparison Matrix

| Attribute | `bobzzite` (Desktop) | `bobzzite-deck` (Handheld) | `bobzzite-nvidia` (RTX/GTX) | `bobzzite-arm64` (ARM64) |
| :--- | :--- | :--- | :--- | :--- |
| **Target Architecture** | `linux/amd64` | `linux/amd64` | `linux/amd64` | `linux/arm64` |
| **Upstream Base** | `bazzite:latest` | `bazzite-deck:latest` | `bazzite-nvidia:latest` | `bazzite:latest` |
| **Primary Compositor** | KWin Wayland (Plasma 6) | Gamescope Gamepad UI + KWin | KWin Wayland (Plasma 6) | KWin Wayland (Plasma 6) |
| **Driver Stack** | Mesa RADV / ANV (ACO) | Mesa RADV (Custom APU ACO) | NVIDIA 565+ (AKMOD Kernel) | Mesa Panfrost / Turnip |
| **Video Hardware Encoders**| VA-API / AMF / QuickSync | VA-API / AMF (RDNA 2/3) | NVENC / NVDEC / Optical Flow | V4L2M2M / VA-API |
| **Display Leasing** | Wayland DRM Display Leasing | Native Gamescope DRM Leasing | NVIDIA DRM KMS Display Lease | Wayland DRM Display Leasing |
| **Audio Quantum Buffer** | 128 frames (~2.9ms latency) | 256 frames (~5.8ms latency) | 128 frames (~2.9ms latency) | 256 frames (~5.8ms latency) |
| **PRIME Render Offload** | `DRI_PRIME=1` | Unified APU Architecture | `__NV_PRIME_RENDER_OFFLOAD=1` | Unified SoC Memory |
| **Hardware Ray Tracing** | Vulkan KHR Ray Tracing | Emulated / RDNA 2 BVH | Native RTX Hardware RT Cores | Software / Future Turnip |
| **Thermal Fan Management**| ACPI Fan Curve Daemon | Handheld Daemon Curve | `nvidia-powerd` + ACPI Fan | Device Tree Thermal Zones |
| **Motion Sensor / Gyro** | External USB Gamepads | 6-Axis IIO Hardware Gyro | External USB Gamepads | Integrated I2C / IIO Sensors |
| **Battery Thresholding** | 80% Max Charge Option | 80% Battery Longevity Cap | 80% Workstation Cap | Dynamic Sysfs Battery Limit |
| **Shared Memory Pipeline** | Wayland `wl_shm` + DMA-BUF | Wayland `wl_shm` + DMA-BUF | Wayland `wl_shm` + DMA-BUF | Wayland `wl_shm` + DMA-BUF |

---

## Profiler & Inspection Commands

### Automated Matrix Comparison
```bash
# Print formatted comparison table
bobzzite-build-flavors all compare

# Side-by-side terminal comparison between two specific flavors
bobzzite-diff bobzzite bobzzite-deck terminal
```

### JSON Profile Export
```bash
# Export machine-readable profile for CI/CD or local automation
bobzzite-build-flavors bobzzite-deck export-profile
cat /tmp/bobzzite-flavors/bobzzite-deck-profile.json
```

---

## Master JSON Profile Catalog

All JSON profiles are version-controlled in `hardware_profiles/` and embedded into `/usr/share/bobzzite/hardware_profiles/`:
- `bobzzite.json`
- `bobzzite-deck.json`
- `bobzzite-nvidia.json`
- `bobzzite-arm64.json`

---

## Integration with Bobzzite Control Center

The **Bobzzite Control Center** exposes direct buttons for both flavor profile inspection and side-by-side comparison under the **🎮 Hardware & Gaming Profiles** panel:
- **Inspect Target Profile**: Run deep diagnostic inspection on target flavors via `bobzzite-deploy profile-inspect`.
- **Compare Profiles**: Generate the side-by-side capability matrix in real time via `bobzzite-build-flavors all compare`.
- **Profile Diff Analyzer**: Run comparative differential analysis across flavors via `bobzzite-diff`.
- **Deploy Compliance Audit**: Validate host compliance prior to atomic ostree rebase via `bobzzite-deploy profile-audit`.
