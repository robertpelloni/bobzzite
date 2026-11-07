# Bobzzite OS Hardware Profile Validation Guide

## Overview

The `bobzzite-profile-validate` tool audits generated hardware profiles (`/tmp/bobzzite-flavors/<flavor>-profile.json`) against distribution architectural standards. It tests compositor assignments, driver stacks, video encoders, and default audio quantum buffer settings.

---

## Validation Schema & Assertions

| Flavor | Required Compositor | Audio Quantum Buffer | Target Encoders |
| :--- | :--- | :--- | :--- |
| **`bobzzite`** | `kwin_wayland` | `128` frames (~2.9ms) | `vaapi`, `qsv`, `amf` |
| **`bobzzite-deck`** | `gamescope` | `256` frames (~5.8ms) | `vaapi`, `amf` |
| **`bobzzite-nvidia`** | `kwin_wayland` | `128` frames (~2.9ms) | `nvenc`, `nvdec`, `cuda` |

---

## CLI Usage

```bash
# Validate profiles for all target flavors
bobzzite-profile-validate all

# Validate a specific flavor
bobzzite-profile-validate bobzzite-deck
```

---

## Integration in CI & QA Pipelines

1. `bobzzite-profile-validate` generates profiles on demand if missing using `scripts/build-flavors.sh <flavor> export-profile`.
2. Any assertion failure causes the validator to exit with non-zero status code `1`, halting automated CI pipelines before images are pushed to GitHub Container Registry.
