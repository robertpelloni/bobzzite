# Bobzzite OS - OpenXR Eye-Tracking & Dynamic Foveated Rendering Guide

The `bobzzite-eye-track` utility provides hardware detection, 5-point gaze matrix calibration, and Variable Rate Shading (VRS) Dynamic Foveated Rendering (DFR) integration for OpenXR runtimes and Godot 4 VR projects.

## Architecture & Standards

1. **OpenXR Extension Conformance**:
   - `XR_EXT_eye_gaze_interaction`: Industry standard gaze raycast tracking for user input and accessibility.
   - `XR_FB_eye_tracking_social`: Eye expression and blink telemetry for multiplayer avatars.
2. **Dynamic Foveated Rendering (DFR)**:
   - Uses Vulkan Variable Rate Shading (Tier 2) to concentrate full GPU fragment shading resolution exclusively at the foveal gaze center (`~15°` visual angle).
   - Reduces peripheral shading workload by up to `40%`, delivering substantial framerate boosts at high VR headset resolutions (Quest Pro, PSVR2, HTC Vive Pro Eye).

## Usage

```bash
# Probe OpenXR runtime eye-tracking extensions and USB sensors
bobzzite-eye-track status

# Run interactive 5-point eye-gaze calibration matrix
bobzzite-eye-track calibrate

# Test gaze vector latency and hit confidence
bobzzite-eye-track test
```

## Control Center Integration

`bobzzite-eye-track` is wired into the **🎮 Hardware & Gaming Profiles** panel in **Bobzzite Control Center** (`bobzzite-control-center`), allowing instant eye-tracking calibration and telemetry verification.
