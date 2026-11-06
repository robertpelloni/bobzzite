# Bobzzite OS Audio & PipeWire Architecture Guide

## Overview

Bobzzite OS utilizes **PipeWire** and **WirePlumber** as its modern, unified low-latency multimedia routing daemon. For indie game developers developing audio in Godot 4, Audacity, or digital audio workstations (DAWs), deterministic audio buffer latency without crackling (underruns / xruns) is critical.

The `bobzzite-audio` utility provides simple diagnostics, latency profile switching, and configuration management.

---

## The `bobzzite-audio` Tool

Run `bobzzite-audio` from a terminal or trigger it from the **Bobzzite Control Center**.

```bash
# Query active audio daemons, sound cards, and PipeWire quantum
bobzzite-audio status

# Switch to Low-Latency Pro-Audio Mode (128 buffer quantum / ~2.6ms latency)
bobzzite-audio low-latency

# Reset to dynamic desktop quantum (powersaving / standard)
bobzzite-audio reset

# Run a stereo channel diagnostic test
bobzzite-audio test
```

---

## PipeWire Buffer Latency & Quantum

In PipeWire, latency is governed by the **quantum** (buffer size in frames) divided by the sample rate:

$$\text{Latency (ms)} = \frac{\text{Quantum}}{\text{Sample Rate (Hz)}} \times 1000$$

- **Dynamic (Default):** PipeWire dynamically scales quantum between 512 and 2048 frames (~10.6ms to 42.6ms) for energy efficiency.
- **Low-Latency Mode (128 frames at 48kHz):** Yields ~2.66ms of processing latency, ideal for real-time MIDI input, live Foley recording in Audacity, and rhythm game development.
- **Ultra Low-Latency Mode (64 frames at 48kHz):** Yields ~1.33ms of latency on dedicated high-performance USB audio interfaces.

---

## Troubleshooting Common Audio Issues

### Steam Deck Internal Speakers vs Headphone Jack
- If headphones are plugged in but audio continues routing through speakers, inspect active sink endpoints with `wpctl status` and set the default sink with `wpctl set-default <ID>`.

### Audio Crackling or Stutters (Xruns)
- If crackling occurs under high CPU load, reset to default dynamic latency with `bobzzite-audio reset` or optimize the CPU governor using `bobzzite-tweak performance`.
