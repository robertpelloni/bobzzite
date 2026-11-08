# Bobzzite OS Hardware Quirks & Device Workarounds Guide

## Overview

Bobzzite OS integrates automated device quirk detection and runtime workarounds (`bobzzite-quirks`) to ensure optimal behavior across diverse handheld, desktop, and mobile gaming architectures.

---

## Supported Devices & Mitigations

### 1. Valve Steam Deck (LCD & OLED)
- **Quirk:** Native portrait-oriented 800p/1200p display panels.
- **Mitigation:**
  - `kwin_wayland` orientation metadata override.
  - Gamescope launch flag: `--rotate right`.
  - Custom ALSA DSP configuration for headphone audio balance (`steamdeck-dsp`).

### 2. ASUS ROG Ally (RC71L / RC72L)
- **Quirk:** Cirrus CS35L41 Smart Amplifier firmware loss after suspend/resume.
- **Mitigation:**
  - Automated firmware reload script on systemd sleep wake.
  - IIO BMI085 accelerometer calibration profile for gyro aiming.

### 3. Lenovo Legion Go
- **Quirk:** Detachable TrueStrike controllers causing USB hub re-enumeration pauses.
- **Mitigation:**
  - High-priority udev rules preventing input thread blocking.
  - 144Hz 1600p portrait display scanout transformation.

### 4. NVIDIA Workstations
- **Quirk:** Wayland explicit sync flicker on select Vulkan titles.
- **Mitigation:**
  - Driver parameter `nvidia_drm.modeset=1` with KMS buffer allocation.

---

## CLI Quirk Manager

```bash
# Probe active hardware and list matching device quirks
bobzzite-quirks probe

# Apply runtime mitigations
bobzzite-quirks apply
```
