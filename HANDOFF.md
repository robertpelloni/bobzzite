# Bobzzite OS - Session Handoff & Architecture Transition Guide

**Current Version:** 4.8.0
**State:** Production-Ready Immutable Game Development OS Container
**Target Upstream:** `ghcr.io/ublue-os/bazzite:latest` (Universal Blue / Fedora 41)

---

## 1. System Overview & Architecture

Bobzzite is a specialized distribution designed for indie game developers, pixel artists, chiptune composers, and gaming handheld enthusiasts. It provides an atomic, ostree-based system layered directly on Fedora Silverblue via Universal Blue (`bazzite`).

Key integrated subsystems include:
- **Unified Dashboard**: Single-window Python/Tkinter `bobzzite-control-center` with grouped tabs, real-time logging, asynchronous subprocess workers, tooltips, and system tray management (`bobzzite-tray`). Exposes flavor inspection, matrix comparison, profile validation, hardware fit analysis, broad compatibility auditing, and WebRTC browser streaming.
- **Complete Indie Tooling**: Godot 4, VS Codium, Blender, Aseprite, Audacity, LMMS, Inkscape, Tiled, RenderDoc, and Krita.
- **Hardware Profile & Matrix Testing**: Automated flavor build matrix (`scripts/build-flavors.sh`) supporting `bobzzite` (desktop AMD/Intel), `bobzzite-deck` (handhelds with Gamescope), and `bobzzite-nvidia` (GeForce workstations) with automated inspection, comparison matrices, JSON profile export, smoke dry-runs, profile assertion validation (`bobzzite-profile-validate`), hardware fit analysis (`bobzzite-deploy profile-analyze`), compatibility auditing (`bobzzite-compat`), and compliance auditing.
- **Remote Playtesting & Streaming**: Both Moonlight/Sunshine native game streaming (`bobzzite-stream`) and zero-install WebRTC browser streaming (`bobzzite-webrtc`).
- **Asset, Packaging, Audio, & Test Pipelines**: Low-latency PipeWire quantum configurations, asset compression, gettext translation compilations, GDScript syntax validation, and SCons custom Godot export template builds.

---

## 2. Active Utilities Catalog

All utilities are located in `scripts/` and mirrored in `config/files/usr/local/bin/`:
1. `bobzzite-control-center`: Main unified desktop GUI with hardware comparison, profile validation, fit analysis, compatibility auditing, and WebRTC streaming integration.
2. `bobzzite-tray`: System tray daemon with quick actions and server termination controls.
3. `bobzzite-doctor`: Comprehensive system diagnostics and configuration auditor.
4. `bobzzite-flavors` / `bobzzite-build-flavors`: Multi-hardware flavor build engine with `inspect`, `compare`, `export-profile`, `matrix-test`, and `config` actions.
5. `bobzzite-profile-validate`: Hardware profile assertion and constraint validator.
6. `bobzzite-compat`: Broad hardware compatibility and tier auditor.
7. `bobzzite-hardware-audit`: ACPI sleep, DRM leasing, and controller hardware compliance auditor.
8. `bobzzite-validate`: Repository integrity and build readiness validator.
9. `bobzzite-package`: Headless Godot game packager and AppImage bundler.
10. `bobzzite-export-templates`: SCons-based Godot export template builder.
11. `bobzzite-test`: Headless GDScript syntax validator and game unit tester.
12. `bobzzite-assets`: Lossless texture and audio transcoding pipeline.
13. `bobzzite-i18n`: Multi-language CSV to GNU gettext compiler.
14. `bobzzite-audio`: PipeWire low-latency quantum buffer management.
15. `bobzzite-bench`: CPU, disk I/O, and Vulkan GPU benchmarking.
16. `bobzzite-stream`: Sunshine host and Moonlight client manager.
17. `bobzzite-webrtc`: WebRTC browser remote streaming gateway.
18. `bobzzite-vr`: Monado OpenXR and Wayland DRM display lease manager.
19. `bobzzite-tweak`: Kernel sysctl, ZRAM, and power-profile optimizer.
20. `bobzzite-clean`: Flatpak cache and temporary directory cleaner.
21. `bobzzite-deploy`: Hardware detection, profile fit analysis, and atomic rebase assistant.
22. `bobzzite-gamepad`: Gamepad input event listener and latency tester.
23. `bobzzite-backup`: Btrfs/ostree config snapshot and rollback utility.
24. `bobzzite-devbox`: Containerized distrobox environment launcher.
25. `bobzzite-onboarding`: First-boot interactive walkthrough.
26. `bobzzite-mesh`: Peer-to-peer multiplayer testing mesh.
27. `bobzzite-iso`: Universal Blue ISO build wrapper.

---

## 3. Resume Instructions for Successor Models

To resume work without friction:
1. Run `python3 scripts/validate_build.py` to confirm all 31 scripts and 26 documentation guides pass syntax and path checks.
2. Run `docker build --check -f Containerfile .` to verify containerfile syntax.
3. Consult `TODO.md` and `ROADMAP.md` for upcoming enhancements.
