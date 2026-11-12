# Bobzzite OS Comprehensive Hardware Profile Summary

## Overview

The `bobzzite-summary` tool aggregates all version-controlled hardware profile JSON specifications directly from `hardware_profiles/` to produce aligned compatibility and deployment summaries across all distribution targets.

---

## Hardware Profile Matrix

| Flavor Target | Architecture | Compositor | Target Driver Stack | Audio Buffer |
| :--- | :--- | :--- | :--- | :--- |
| **`bobzzite`** | `linux/amd64` | `kwin_wayland` | Mesa RADV / ANV | 128 frames (~2.9ms) |
| **`bobzzite-deck`** | `linux/amd64` | `gamescope` | RADV ACO (AMD Mesa) | 256 frames (~5.8ms) |
| **`bobzzite-nvidia`** | `linux/amd64` | `kwin_wayland` | NVIDIA Proprietary AKMOD | 128 frames (~2.9ms) |
| **`bobzzite-arm64`** | `linux/arm64` | `kwin_wayland` | Mesa Panfrost / Freedreno | 256 frames (~5.8ms) |

---

## CLI Usage

```bash
# Print formatted terminal summary table
bobzzite-summary terminal

# Output Markdown matrix table
bobzzite-summary markdown

# Output consolidated JSON bundle
bobzzite-summary json
```

For the complete detailed specifications and compliance ratings across all flavors, see [`docs/HARDWARE_PROFILE_SUMMARY_DATA.md`](HARDWARE_PROFILE_SUMMARY_DATA.md).
