# bobzzite Game Controller & Handheld Mapping Guide

bobzzite offers comprehensive gamepad compatibility across standard Bluetooth/USB controllers and handheld PC gaming devices.

---

## 1. Supported Controllers Out-of-the-Box

- **Valve Steam Deck**: Built-in trackpads, gyroscopes, back grip buttons (L4/L5/R4/R5).
- **ASUS ROG Ally & Lenovo Legion Go**: Embedded gamepad controllers managed through Bazzite HandyGCCS.
- **Xbox Wireless & Elite Controllers**: Native X-Input kernel mapping with rumble support.
- **Sony DualSense & DualShock 4**: Gyroscope, haptic feedback, and touchpad mouse emulation.
- **Nintendo Switch Pro & Joy-Cons**: Bluetooth pairing and split/combined Joy-Con profiles.

---

## 2. Using `bobzzite-gamepad`

```bash
# List all connected joysticks, controllers, and USB devices
bobzzite-gamepad list

# Test gamepad inputs and axes
bobzzite-gamepad test

# Initialize handheld PC controller profile
bobzzite-gamepad handheld-profile
```

---

## 3. Steam & Gamescope Integration

When using the `bobzzite-deck` flavor or running Steam Big Picture:
- Access the Steam controller configurator via the **Guide Button** (Steam / Xbox / PS button).
- Per-game controller profiles can be remapped, calibrated, or loaded from community presets.
