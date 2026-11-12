# Bobzzite OS Audio Quantum Latency Stress Benchmark

## Overview

The `bobzzite-audio-stress` utility evaluates PipeWire low-latency buffer quantum configurations (64, 128, 256, 512 frames at 48kHz) under simulated game audio digital signal processing (DSP) workloads. In real-time indie game development and rhythm game playtesting, audio buffer underruns (xruns) produce audible clicks and desynchronizations. This benchmark verifies that the system's real-time priority scheduling (RTKit) and ALSA ring buffers maintain deterministic audio processing with zero dropouts.

---

## 1. Latency & DSP Capacity Matrix

| Quantum Size | Sample Rate | Target Latency | Recommended Use Case | Max Safe DSP Load |
| :--- | :--- | :--- | :--- | :--- |
| **64 frames** | 48,000 Hz | **1.33 ms** | Rhythm games & low-latency live MIDI | ~45% DSP Capacity |
| **128 frames** | 48,000 Hz | **2.67 ms** | Default Bobzzite Pro-Audio workstation | ~80% DSP Capacity |
| **256 frames** | 48,000 Hz | **5.33 ms** | Handheld gaming (Steam Deck / ROG Ally) | ~80% DSP Capacity |
| **512 frames** | 48,000 Hz | **10.67 ms** | High-poly 3D rendering & battery saving | ~85% DSP Capacity |

---

## 2. CLI Usage

```bash
# Run audio stress benchmark against the default 128 quantum
bobzzite-audio-stress run 128

# Stress test ultra-low latency 64 quantum
bobzzite-audio-stress run 64

# Audit all quantum presets and display benchmark comparison table
bobzzite-audio-stress audit
```
