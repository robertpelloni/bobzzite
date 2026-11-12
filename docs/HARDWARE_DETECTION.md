# Bobzzite OS - Automated Hardware Flavor Detection Guide

The `bobzzite-deploy` utility inspects host DMI firmware product strings, PCI device vendor and product classes, and kernel subsystem capabilities to determine the optimal Bobzzite OS hardware flavor for any machine.

## Detection Logic

1. **Handheld Console Detection**:
   Inspects `/sys/class/dmi/id/product_name` for known hardware signatures:
   - Valve Steam Deck (`Jupiter`, `Galileo`)
   - ASUS ROG Ally
   - Lenovo Legion Go
   - AYANEO, GPD Win, and OneXPlayer devices
   - *Recommendation:* `bobzzite-deck` (Gamescope session, handheld power controls, TDP tuning).

2. **Discrete NVIDIA GPU Detection**:
   Queries PCI vendor IDs via `lspci -nn` matching `10de` (NVIDIA Corporation):
   - *Recommendation:* `bobzzite-nvidia` (Proprietary open-kernel modules, CUDA, OptiX, NVENC).

3. **Standard PC Workstation**:
   Fallback for generic AMD Radeon (RDNA / GCN) and Intel (Arc / Iris Xe) architectures:
   - *Recommendation:* `bobzzite` (Lightweight open-source Mesa drivers, KDE Plasma Wayland).

## Integrated Rebase Subcommands

`bobzzite-deploy` exposes full verification commands before rebase:

```bash
# Detect recommended flavor
bobzzite-deploy detect

# Compute quantitative hardware fit percentage
bobzzite-deploy profile-analyze

# Inspect target hardware profile JSON
bobzzite-deploy profile-inspect bobzzite-deck

# Compare side-by-side profile differences
bobzzite-deploy profile-compare bobzzite bobzzite-deck

# Audit hardware compliance (sleep, DRM leasing, controllers)
bobzzite-deploy profile-audit

# Validate target profile assertion constraints
bobzzite-deploy profile-validate bobzzite-deck

# Rebase to recommended flavor
sudo bobzzite-deploy bobzzite-deck
```

## Control Center Integration

Hardware detection and rebase helpers are accessible directly within **Bobzzite Control Center** under the **🎮 Hardware & Gaming Profiles** panel.
