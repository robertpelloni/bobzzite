# Bobzzite OS - Hardware Profile Deployment & Rebase Guide

The `bobzzite-deploy` utility orchestrates hardware detection, profile fit scoring, specification inspection, differential analysis, and atomic rebases across all supported Bobzzite OS hardware flavors.

## Supported Flavors

- `bobzzite`: Desktop AMD Radeon and Intel Graphics workstations.
- `bobzzite-deck`: Handheld consoles (Valve Steam Deck, ASUS ROG Ally, Lenovo Legion Go) with Gamescope session.
- `bobzzite-nvidia`: High-performance workstations with NVIDIA GeForce GPUs and proprietary drivers.
- `bobzzite-arm64`: ARM64 SBCs and Snapdragon X Elite laptops.

## Commands

```bash
# Auto-detect host hardware and display recommended flavor
bobzzite-deploy detect

# Calculate quantitative fit percentages for this physical machine
bobzzite-deploy profile-analyze

# Inspect target hardware profile JSON specification
bobzzite-deploy profile-inspect bobzzite-deck

# Compare two profiles side-by-side
bobzzite-deploy profile-compare bobzzite bobzzite-nvidia

# Atomically rebase host system to target flavor
sudo bobzzite-deploy bobzzite-deck
```

## Control Center Integration

All deployment and profile commands are directly accessible in **Bobzzite Control Center** (`bobzzite-control-center`) under the **🎮 Hardware & Gaming Profiles** panel.
