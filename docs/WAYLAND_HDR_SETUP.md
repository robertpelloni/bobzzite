# Bobzzite OS - Wayland Color Management & HDR Calibration Guide

The `bobzzite-hdr` utility manages Wayland color management protocols, High Dynamic Range (HDR) display detection, Perceptual Quantizer (PQ / ST.2084) EOTF curves, and Gamescope HDR rendering arguments.

## Architecture

1. **Protocol Implementation**:
   - `xx-color-management-v4`: Modern Wayland standard enabling applications to submit wide color gamut (BT.2020) and high dynamic range content.
   - DRM Kernel Static Metadata: Probes HDMI/DisplayPort connectors for CTA-861-G HDR static metadata.
2. **Luminance Tone-Mapping Standards**:
   - Follows ITU-R BT.2408 recommendations: maps standard SDR user interface elements to `203 nits`, preserving head-room for highlights up to `1000 nits` on OLED/Mini-LED panels.
3. **Gamescope Integration**:
   - Passes `--hdr-enabled --hdr-sdr-content-nits 203` to allow Steam Deck OLED and external HDR displays to tone-map cleanly without clipping.

## Usage

```bash
# Probe active display HDR capabilities and Wayland protocol state
bobzzite-hdr status

# Calibrate and apply HDR tone-mapping profile
bobzzite-hdr calibrate

# Run 10-bit Rec.2020 primary color patch test
bobzzite-hdr test
```

## Control Center Integration

`bobzzite-hdr` is integrated under **🎮 Hardware & Gaming Profiles** in **Bobzzite Control Center** (`bobzzite-control-center`), providing rapid status checks and calibration.
