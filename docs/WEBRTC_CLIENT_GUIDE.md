# Bobzzite OS WebRTC Playtest Client Architecture Guide

## Overview

The Bobzzite WebRTC playtest client (`bobzzite-webrtc generate-client`) produces a zero-dependency HTML5/JavaScript playtest client designed for browser testing without installing external binaries.

---

## Architecture & Subsystems

1. **Video Streaming Pipeline**:
   - WebRTC RTP MediaStream decoding via hardware-accelerated WebCodecs.
   - Low-latency canvas rendering (<16ms frame times).
2. **Audio Streaming Pipeline**:
   - Stereo Opus audio decode at 48kHz, synchronized with the PipeWire audio engine.
3. **Gamepad & Touch Emulation**:
   - W3C Gamepad API polling loop transmitting analog joystick and digital button events back over an encrypted WebRTC DataChannel (Port 48000/UDP).
   - Multi-touch screen controls for tablet and mobile browser testing.

---

## Generating & Testing the Client

```bash
# Generate the client HTML5 page in /tmp/bobzzite-webrtc-client/index.html
bobzzite-webrtc generate-client

# Open client in default browser
xdg-open /tmp/bobzzite-webrtc-client/index.html
```
