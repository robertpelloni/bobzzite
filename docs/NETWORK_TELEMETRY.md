# Bobzzite OS Network & Streaming Telemetry Guide

## Overview

Bobzzite OS integrates live network I/O bitrate tracking into the remote web dashboard (`bobzzite-webdash`). This monitors streaming bandwidth consumption when hosting low-latency playtests via Sunshine, Moonlight, or WebRTC.

---

## Polling & Calculation

- **Data Source:** `/proc/net/dev` parsing all active network interface bytes (excluding loopback).
- **Delta Calculation:** Compares byte counts across consecutive 2-second polling intervals:
  $$\text{Rate (kB/s)} = \frac{\Delta \text{Bytes}}{1024 \times \Delta t}$$
- **Canvas Rendering:** HTML5 dual-trace canvas graph rendering instantaneous download (RX) and upload (TX) bitrates in green vector strokes.

---

## Remote Web Dashboard Usage

```bash
# Launch dashboard server
bobzzite-webdash
```
Open `http://<ip>:8080/` to inspect real-time network graphs.
