# Bobzzite OS Handheld Gyro & Motion Sensor Calibration

## Overview

The `bobzzite-gyro` utility audits Industrial I/O (IIO) sensor devices and evdev motion event nodes, calculates stationary bias drift offsets, and writes calibration profiles for 6-axis Inertial Measurement Units (IMUs). On gaming handhelds (Valve Steam Deck, ASUS ROG Ally, Lenovo Legion Go), precision motion aiming and Godot 4 gyroscope input require regular bias drift calibration.

---

## 1. Sensor Architecture & IIO Bus

- **Industrial I/O (`/sys/bus/iio/devices/`)**: Kernel interface exposing raw angular velocity (`in_anglvel_*_raw`) and linear acceleration (`in_accel_*_raw`).
- **Linux Input Evdev Subsystem (`/dev/input/event*`)**: Handles mapped motion events forwarded into Steam Input and SDL2.
- **Embedded Controller (EC)**: Synchronizes handheld IMU hardware sampling rates (up to 1000Hz).

---

## 2. Calibration Procedure

When calibrating:
1. Place the handheld device on a completely flat, vibration-free surface.
2. The calibration engine samples 1,000 baseline readings across pitch, yaw, and roll axes.
3. Zero-rate drift bias offsets are computed and saved to `~/.config/bobzzite/gyro-calibration.json`.
4. Steam Input and Godot 4 automatically ingest the calibrated offsets.

---

## 3. CLI Usage

```bash
# Probe active IIO devices and evdev event nodes
bobzzite-gyro probe

# Run stationary resting calibration
bobzzite-gyro calibrate

# Test real-time motion telemetry stream
bobzzite-gyro test
```
