# Bobzzite OS Hardware Profiles Catalog

## Overview

The `hardware_profiles/` directory maintains repository-tracked, version-controlled JSON specifications for all supported Bobzzite OS container targets:

1. **`hardware_profiles/bobzzite.json`**: Desktop and laptop AMD Radeon and Intel Arc graphics.
2. **`hardware_profiles/bobzzite-deck.json`**: Handheld gaming PCs (Steam Deck LCD/OLED, ASUS ROG Ally, Lenovo Legion Go).
3. **`hardware_profiles/bobzzite-nvidia.json`**: Workstations and laptops with NVIDIA GeForce RTX/GTX GPUs.
4. **`hardware_profiles/bobzzite-arm64.json`**: ARM64 Snapdragon X Elite and Rockchip RK3588 systems.

---

## JSON Schema Specification

```json
{
  "flavor": "bobzzite-deck",
  "arch": "linux/amd64",
  "version": "5.5.0",
  "base_image": "ghcr.io/ublue-os/bazzite-deck:latest",
  "compositor": "gamescope",
  "hardware_target": "Handheld Gaming PCs (Steam Deck, ROG Ally, Legion Go)",
  "driver_stack": "RADV ACO (AMD Mesa)",
  "video_encoders": ["vaapi", "amf"],
  "audio_quantum_default": 256
}
```

---

## Validation & Auditing

The catalog is verified continuously by `scripts/bobzzite-profile-validate.sh` and checked during CI runs via `scripts/validate_build.py`.
