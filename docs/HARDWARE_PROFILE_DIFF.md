# Bobzzite OS - Hardware Profile Differential Analyzer Guide

The `bobzzite-diff` utility inspects and analyzes structural divergences between two target hardware profile specifications stored in `hardware_profiles/`.

## Purpose

When migrating across hardware form factors (e.g., standard Desktop workstation `bobzzite` to Valve Steam Deck handheld `bobzzite-deck` or NVIDIA workstation `bobzzite-nvidia`), developers and QA teams must identify:
- Host architecture changes (`x86_64` vs `aarch64`)
- Display compositor transitions (`kwin_wayland` vs `gamescope`)
- Driver stack substitutions (`mesa-radeonsi` vs `nvidia-proprietary-open` vs `panfrost`)
- Audio low-latency quantum presets (`128/48000` vs `256/48000`)

## Usage

```bash
# Compare standard desktop against Steam Deck in colored terminal mode
bobzzite-diff bobzzite bobzzite-deck terminal

# Output Markdown report for GitHub PRs or release notes
bobzzite-diff bobzzite bobzzite-nvidia markdown

# Output structured JSON comparison for CI pipelines
bobzzite-diff bobzzite bobzzite-arm64 json
```

## Supported Flavors

- `bobzzite`: Standard Workstation (AMD/Intel GPU, KDE Plasma Wayland)
- `bobzzite-deck`: Handheld Console (Steam Deck / ROG Ally / Legion Go, Gamescope session)
- `bobzzite-nvidia`: High-Performance Workstation (NVIDIA RTX / CUDA / OptiX)
- `bobzzite-arm64`: ARM64 Embedded / Mobile (Snapdragon X Elite / RK3588, Panfrost / Mesa)

## Control Center Integration

`bobzzite-diff` is integrated directly into the **Bobzzite Control Center** under the **System** tab, allowing developers to execute quick side-by-side profile audits with a single click.
