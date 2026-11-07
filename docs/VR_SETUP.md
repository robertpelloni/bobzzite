# Bobzzite OS VR & OpenXR Development Guide

## Overview

Bobzzite OS includes built-in support for Virtual Reality (VR) and Extended Reality (XR) hardware, OpenXR runtimes, and standalone wireless headset streaming.

Whether developing immersive 3D games in Godot 4 using the OpenXR action map or testing on SteamVR, Bobzzite provides pre-configured Wayland direct display leasing (`wp_drm_lease_device_v1`) and OpenXR runtime management.

---

## The `bobzzite-vr` Diagnostic Tool

Run `bobzzite-vr` to inspect connected hardware, verify OpenXR runtimes, and switch active drivers.

```bash
# Check USB headsets, DRM display lease status, and active OpenXR manifests
bobzzite-vr status

# Switch default OpenXR runtime to Monado (open-source)
bobzzite-vr setup-monado

# Switch default OpenXR runtime to SteamVR
bobzzite-vr setup-steamvr
```

---

## Headset Compatibility

1. **Valve Index & HTC Vive (Tethered PCVR):**
   - Direct DisplayPort connection to dedicated AMD or NVIDIA GPU.
   - Wayland compositor grants exclusive direct leasing directly to SteamVR or Monado.
2. **Meta Quest 2 / 3 / Pro (Wireless Streaming):**
   - Connect wirelessly over Wi-Fi 6 or USB-C tether via **ALVR** or **WiVRn**.
3. **Bigscreen Beyond & Windows Mixed Reality (WMR):**
   - Supported via Monado with OpenHMD / libsurvive tracking.

---

## Developing VR Games in Godot 4

1. Launch Godot 4 through Bobzzite Control Center.
2. Under **Project Settings > XR > OpenXR**, enable `Enabled`.
3. Configure the OpenXR action map for motion controllers (grip, trigger, joystick, buttons).
4. Run the project directly from Godot (`F5`) with your headset connected or streaming.
