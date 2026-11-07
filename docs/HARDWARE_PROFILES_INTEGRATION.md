# Bobzzite OS Hardware Profiles & Flavor Inspector Guide

## Overview

The Bobzzite OS flavor build engine incorporates an automated inspection pipeline (`bobzzite-build-flavors all inspect`) that audits target container base image mappings, default compositor settings, and hardware acceleration drivers across hardware profiles:

1. **`bobzzite`**: Desktop AMD Radeon RX 5000–7000 and Intel Arc / UHD graphics.
2. **`bobzzite-deck`**: Handheld gaming PCs (Steam Deck LCD/OLED, ASUS ROG Ally, Lenovo Legion Go, AYANEO).
3. **`bobzzite-nvidia`**: Desktop and laptop workstations equipped with NVIDIA GeForce RTX/GTX GPUs.

---

## Running the Flavor Profile Inspector

```bash
# Inspect all target flavors
bobzzite-build-flavors all inspect

# Inspect handheld PC flavor specifically
bobzzite-build-flavors bobzzite-deck inspect
```

---

## Hardware Profile Integration Points

- **Bobzzite Control Center:** Direct one-click inspection via the **Hardware Flavors** action button.
- **GitHub Actions CI:** Automated pre-build smoke validation ensuring all target image tags resolve correctly.
- **Local Deployment:** Combined with `bobzzite-deploy detect` to automatically pair physical machines with the matching hardware flavor profile.
