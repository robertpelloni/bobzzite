# Bobzzite OS Live Hardware Telemetry Guide

## Overview

Bobzzite OS integrates live hardware and compute resource telemetry streaming into both the desktop Control Center and the lightweight remote web dashboard (`bobzzite-webdash`).

---

## Polled Metrics & Interfaces

1. **CPU Utilization & Load Average**:
   - Polled via `os.getloadavg()` and `/proc/loadavg` at 2-second intervals.
   - Rendered using HTML5 vector canvas line graphs with historical ring buffering (20 frames).
2. **Memory Availability**:
   - Extracted directly from `/proc/meminfo` (`MemTotal` and `MemAvailable`).
3. **Thermal Zones**:
   - Read from sysfs interface `/sys/class/thermal/thermal_zone0/temp` and converted to degrees Celsius.
4. **Host Identification**:
   - DMI product names probed via `/sys/class/dmi/id/product_name`.

---

## Accessing Telemetry

- **Locally:** Launch the Bobzzite Control Center and view real-time diagnostics under **Live Telemetry**.
- **Remotely:** Navigate to `http://<device-ip>:8080/` in any web browser connected to the local mesh or Wi-Fi network.
