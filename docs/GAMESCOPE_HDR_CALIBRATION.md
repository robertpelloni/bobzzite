# Bobzzite OS Gamescope HDR Calibration & Tone-Mapping Pipeline

## Overview

The `bobzzite-hdr-cal` utility computes display-specific peak nit luminance mappings and generates calibrated Gamescope arguments and DXVK/VKD3D HDR environment variables. High Dynamic Range (HDR) gaming requires precise luminance calibration to prevent highlight clipping and black crush across OLED, Mini-LED, and HDR10-compatible external displays.

---

## 1. Tone-Mapping Calibration Standards

Bobzzite OS follows ITU-R BT.2408 colorimetry standards:
- **Reference SDR White**: Standardized to `203 nits` (`--hdr-sdr-content-nits 203`).
- **Peak Specular Highlights**: Calibrated from `400 nits` (DisplayHDR 400) to `1000 nits` (Steam Deck OLED / standard HDR10 master) and `1600+ nits` (Mini-LED / QD-OLED).
- **Inverse Tone Mapping (ITM)**: Enabled dynamically via `--hdr-itm-enable` for displays exceeding 1000 nits to enhance legacy SDR games without color distortion.

---

## 2. Generated Gamescope Launch Arguments

When launching games through Steam, Heroic, or Lutris:

```bash
# Standard HDR10 1000 nits display
gamescope --hdr-enabled --hdr-sdr-content-nits 203 --hdr-wide-gammut-for-sdr -- %command%

# High-luminance Mini-LED 1600 nits display
gamescope --hdr-enabled --hdr-sdr-content-nits 203 --hdr-wide-gammut-for-sdr --hdr-itm-enable -- %command%
```

---

## 3. Required Environment Variables

To route native HDR swapchains from Windows games via Proton:
- **`DXVK_HDR=1`**: Enables DXGI HDR swapchain exposure in DXVK.
- **`ENABLE_GAMESCOPE_WSI=1`**: Connects Gamescope's Wayland color management protocols to Vulkan WSI.
- **`WINE_VK_HDR=1`**: Activates Wine Vulkan HDR extension passthrough.

---

## 4. CLI Usage

```bash
# Probe active displays and display default 1000 nit calibration flags
bobzzite-hdr-cal probe

# Generate launch flags for a 1400 nit display with 220 nit SDR white point
bobzzite-hdr-cal generate 1400 220

# Apply calibrated profile to ~/.config/gamescope/hdr-profile.env
bobzzite-hdr-cal apply 1000 203
```
