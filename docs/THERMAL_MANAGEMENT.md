# Bobzzite OS Thermal Fan Curve & Handheld Cooling Management

## Overview

The `bobzzite-fan` utility provides automated thermal sensor auditing, platform cooling device inspection, and acoustic fan curve configuration across Bobzzite OS gaming handhelds, workstations, and laptops. On handheld gaming devices such as the Valve Steam Deck (LCD/OLED), ASUS ROG Ally, and Lenovo Legion Go, intelligent fan curve management balances acoustic comfort with sustained GPU/CPU boost clocks.

---

## Architecture & Sensor Tree

Bobzzite OS audits both the Linux hardware monitoring (`hwmon`) subsystem and the generic thermal zone interface:
1. **`/sys/class/hwmon/`**: Direct temperature input nodes (`temp*_input`) in millidegrees Celsius and fan PWM control interfaces (`pwm*`).
2. **`/sys/class/thermal/`**: Kernel thermal zones (`thermal_zone*`) with associated cooling devices (`cooling_device*`) and trip points.
3. **Platform Embedded Controller (EC)**: Handheld-specific EC interfaces for hardware fan curve smoothing.

---

## Acoustic Fan Profiles

Bobzzite OS defines three dynamic acoustic profiles:
- **`quiet`**: Prioritizes low noise for pixel art (Aseprite) and audio composition (LMMS / Audacity). Trip points: 55°C (20% PWM), 70°C (45% PWM), 85°C (75% PWM).
- **`balanced`**: Default profile for general gaming and game development in Godot 4. Smooth ramp curve preventing fan speed hunting. Trip points: 50°C (30% PWM), 68°C (60% PWM), 82°C (90% PWM).
- **`performance`**: Maximum airflow for sustained 3D rendering in Blender and Godot 4 Forward+ Vulkan pipeline tests. Trip points: 45°C (40% PWM), 65°C (75% PWM), 80°C (100% PWM).

---

## CLI Usage

```bash
# Check thermal sensor nodes and active temperatures
bobzzite-fan status

# Audit all sensors, cooling devices, and display active profile
bobzzite-fan audit

# Apply a specific acoustic fan profile
bobzzite-fan profile quiet
bobzzite-fan profile balanced
bobzzite-fan profile performance
```
