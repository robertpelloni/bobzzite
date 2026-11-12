# Bobzzite OS WebRTC Remote Streaming & Browser Playtesting

## Overview

`bobzzite-webrtc` enables zero-install, low-latency game streaming and remote desktop sessions accessible directly from any standard modern web browser (Chrome, Firefox, Safari, Edge).

Unlike native Moonlight/Sunshine clients which require dedicated application installations, the WebRTC streaming gateway uses standard browser APIs (`RTCPeerConnection`, `MediaStreamTrack`, and HTML5 Gamepad API) to allow instant playtesting on client devices including laptops, tablets, and phones.

---

## Command Reference

```bash
# Probe WebRTC video encoders and network listeners
bobzzite-webrtc status

# Display standard WebRTC port allocations
bobzzite-webrtc ports

# Generate default configuration file (~/.config/bobzzite/webrtc/webrtc.json)
bobzzite-webrtc config

# Start the WebRTC signaling gateway
bobzzite-webrtc start

# Stop the WebRTC gateway
bobzzite-webrtc stop
```

---

## Network & Firewall Ports

| Port | Protocol | Purpose |
| :--- | :--- | :--- |
| **47990** | TCP | HTTPS Web Dashboard & WebRTC Signaling |
| **47998** | UDP | WebRTC RTP Video Stream (H.264/AV1/VP9) |
| **47999** | UDP | WebRTC RTP Audio Stream (Opus 48kHz) |
| **48000** | UDP | WebRTC DataChannel (Gamepad & Keyboard Input) |

---

## Video Hardware Acceleration

The WebRTC streaming pipeline automatically selects the best available hardware encoder:
1. **AMD / Intel Flavors (`bobzzite` & `bobzzite-deck`)**: Hardware-accelerated VA-API encode via Mesa `/dev/dri/renderD128`.
2. **NVIDIA Flavor (`bobzzite-nvidia`)**: Hardware NVENC via proprietary drivers.
3. **Software Fallback**: High-performance multi-threaded `libvpx` / `openh264` CPU encoding.
