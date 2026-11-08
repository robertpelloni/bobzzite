# Bobzzite OS - Session Handoff & Architecture Transition Guide

**Current Version:** 5.5.0
**State:** Production-Ready Multi-Architecture Immutable Game Development OS Container
**Target Upstream:** `ghcr.io/ublue-os/bazzite:latest` (Universal Blue / Fedora 41)

---

## 1. System Overview & Architecture

Bobzzite is a specialized distribution designed for indie game developers, pixel artists, chiptune composers, and gaming handheld enthusiasts. It provides an atomic, ostree-based system layered directly on Fedora Silverblue via Universal Blue (`bazzite`).

Key integrated subsystems include:
- **Unified Dashboard**: Single-window Python/Tkinter `bobzzite-control-center` with grouped tabs, real-time logging, asynchronous subprocess workers, tooltips, and system tray management (`bobzzite-tray`). Exposes flavor inspection, matrix comparison, profile validation, hardware fit analysis, broad compatibility auditing, local CI runner, multi-arch targets, hardware quirk mitigations, remote web dashboard, cryptographic image signature verification, staging/preview builds, hardware profiles catalog, and WebRTC client generation.
- **Complete Indie Tooling**: Godot 4, VS Codium, Blender, Aseprite, Audacity, LMMS, Inkscape, Tiled, RenderDoc, and Krita.
- **Hardware Profile & Matrix Testing**: Automated flavor build matrix (`scripts/build-flavors.sh`) supporting `bobzzite` (desktop AMD/Intel), `bobzzite-deck` (handhelds with Gamescope), `bobzzite-nvidia` (GeForce workstations), and `bobzzite-arm64` (Snapdragon X Elite / RK3588) with repository-tracked specifications in `hardware_profiles/`, automated inspection, comparison matrices, JSON profile export, smoke dry-runs, profile assertion validation (`bobzzite-profile-validate`), hardware fit analysis (`bobzzite-deploy profile-analyze`), compatibility auditing (`bobzzite-compat`), hardware quirk mitigation (`bobzzite-quirks`), cryptographic signing (`bobzzite-sign`), and local CI runner (`bobzzite-ci`).
- **Remote Playtesting & Streaming**: Both Moonlight/Sunshine native game streaming (`bobzzite-stream`) and zero-install WebRTC browser streaming (`bobzzite-webrtc`) with integrated HTML5 gamepad test client generation (`bobzzite-webrtc generate-client`) and remote web administration (`bobzzite-webdash`).
- **Asset, Packaging, Audio, & Test Pipelines**: Low-latency PipeWire quantum configurations, asset compression, gettext translation compilations, GDScript syntax validation, and SCons custom Godot export template builds.

---

## 2. Active Utilities Catalog

All utilities are located in `scripts/` and mirrored in `config/files/usr/local/bin/`:
1. `bobzzite-control-center`: Main unified desktop GUI with hardware comparison, profile validation, fit analysis, compatibility auditing, multi-arch targets, hardware quirks, web dashboard, signature verification, PR preview builds, hardware profiles catalog, CI runner, and WebRTC streaming integration.
2. `bobzzite-tray`: System tray daemon with quick actions and server termination controls.
3. `bobzzite-doctor`: Comprehensive system diagnostics and configuration auditor.
4. `bobzzite-flavors` / `bobzzite-build-flavors`: Multi-hardware flavor build engine with `inspect`, `compare`, `export-profile`, `matrix-test`, `multi-arch`, and `config` actions.
5. `bobzzite-profile-validate`: Hardware profile assertion and constraint validator consuming `hardware_profiles/`.
6. `bobzzite-compat`: Broad hardware compatibility and tier auditor.
7. `bobzzite-quirks`: Hardware device quirks and runtime workaround manager.
8. `bobzzite-webdash`: Lightweight remote web dashboard server.
9. `bobzzite-sign`: Cryptographic container image signature and provenance verifier.
10. `bobzzite-preview`: Ephemeral PR preview image tag generator and staging manager.
11. `bobzzite-ci`: Local automated CI smoke test pipeline runner.
12. `bobzzite-hardware-audit`: ACPI sleep, DRM leasing, and controller hardware compliance auditor.
13. `bobzzite-validate`: Repository integrity and build readiness validator.
14. `bobzzite-package`: Headless Godot game packager and AppImage bundler.
15. `bobzzite-export-templates`: SCons-based Godot export template builder.
16. `bobzzite-test`: Headless GDScript syntax validator and game unit tester.
17. `bobzzite-assets`: Lossless texture and audio transcoding pipeline.
18. `bobzzite-i18n`: Multi-language CSV to GNU gettext compiler.
19. `bobzzite-audio`: PipeWire low-latency quantum buffer management.
20. `bobzzite-bench`: CPU, disk I/O, and Vulkan GPU benchmarking.
21. `bobzzite-stream`: Sunshine host and Moonlight client manager.
22. `bobzzite-webrtc`: WebRTC browser remote streaming gateway and HTML5 client generator.
23. `bobzzite-vr`: Monado OpenXR and Wayland DRM display lease manager.
24. `bobzzite-tweak`: Kernel sysctl, ZRAM, and power-profile optimizer.
25. `bobzzite-clean`: Flatpak cache and temporary directory cleaner.
26. `bobzzite-deploy`: Hardware detection, profile fit analysis, and atomic rebase assistant.
27. `bobzzite-gamepad`: Gamepad input event listener and latency tester.
28. `bobzzite-backup`: Btrfs/ostree config snapshot and rollback utility.
29. `bobzzite-devbox`: Containerized distrobox environment launcher.
30. `bobzzite-onboarding`: First-boot interactive walkthrough.
31. `bobzzite-mesh`: Peer-to-peer multiplayer testing mesh.
32. `bobzzite-iso`: Universal Blue ISO build wrapper.

---

## 3. Resume Instructions for Successor Models

To resume work without friction:
1. Run `python3 scripts/validate_build.py` to confirm all 35 scripts and 34 documentation guides pass syntax and path checks.
2. Run `docker build --check -f Containerfile .` to verify containerfile syntax.
3. Consult `TODO.md` and `ROADMAP.md` for upcoming enhancements.
