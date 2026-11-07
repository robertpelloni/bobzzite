# Bobzzite OS Game Packaging & Release Guide

## Overview

Bobzzite OS streamlines the process of transforming indie game projects into distribution-ready Linux binaries, AppImages, and Flatpaks. With the pre-configured Godot 4 and VS Codium pipeline, developers can build and export games directly from the terminal or using the **Bobzzite Control Center**.

---

## Headless Packaging: `bobzzite-package`

The `bobzzite-package` utility invokes Godot 4 headless export templates to build executable Linux standalone binaries without requiring an active graphical desktop.

```bash
# Package the default starter template project
bobzzite-package ~/Templates/Godot4_Starter "Linux/X11" ~/Builds/Games

# Package a custom game project
bobzzite-package ~/Projects/MyAwesomeGame "Linux/X11" ~/Builds/MyAwesomeGame
```

### Build Outputs
- Binary executable: `~/Builds/Games/<ProjectName>.x86_64`
- Resource pack archive: `~/Builds/Games/<ProjectName>.pck`

---

## Steam Deck & Handheld Verification

To ensure optimal performance and compatibility on the Steam Deck and handheld gaming PCs:

1. **Verify Native Gamepad Input:**
   - Run `bobzzite-gamepad test` to confirm axes and buttons respond cleanly.
2. **Launch with Feral GameMode:**
   - Execute the game with `gamemoderun ./<ProjectName>.x86_64`.
3. **Profile Frame Times with MangoHud:**
   - Launch with `mangohud ./<ProjectName>.x86_64` to verify 60Hz/90Hz refresh rate stability and VRAM usage.
