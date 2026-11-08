# Bobzzite OS - Session Handoff & Architecture Transition Guide

**Current Version:** 6.7.0
**State:** Production-Ready Multi-Architecture Immutable Game Development OS Container
**Target Upstream:** `ghcr.io/ublue-os/bazzite:latest` (Universal Blue / Fedora 41)

---

## 1. System Overview & Architecture

Bobzzite is a specialized distribution designed for indie game developers, pixel artists, chiptune composers, and gaming handheld enthusiasts. It provides an atomic, ostree-based system layered directly on Fedora Silverblue via Universal Blue (`bazzite`).

Key integrated subsystems include:
- **Unified Dashboard**: Single-window Python/Tkinter `bobzzite-control-center` with grouped tabs, real-time logging, asynchronous subprocess workers, tooltips, and system tray management (`bobzzite-tray`). Exposes flavor inspection, matrix comparison, profile validation, hardware fit analysis, broad compatibility auditing, local CI runner, multi-arch targets, hardware quirk mitigations, remote web dashboard with live canvas compute & network telemetry, cryptographic image signature verification, supply-chain provenance attestations, profile differential analysis (`bobzzite-diff`), hardware migration assistant (`bobzzite-migrate`), decentralized IPFS mirrors (`bobzzite-ipfs`), rootless Podman sandboxes (`bobzzite-sandbox`), Prometheus metrics gateway (`bobzzite-metrics`), staging/preview builds, security auditing, hardware profiles catalog, hardware profile summary, hardware compatibility reporting, network bandwidth I/O, and WebRTC client generation.
- **Complete Indie Tooling**: Godot 4, VS Codium, Blender, Aseprite, Audacity, LMMS, Inkscape, Tiled, RenderDoc, and Krita.
- **Hardware Profile & Matrix Testing**: Automated flavor build matrix (`scripts/build-flavors.sh`) supporting `bobzzite` (desktop AMD/Intel), `bobzzite-deck` (handhelds with Gamescope), `bobzzite-nvidia` (GeForce workstations), and `bobzzite-arm64` (Snapdragon X Elite / RK3588) with repository-tracked specifications in `hardware_profiles/` and embedded into `config/files/usr/share/bobzzite/hardware_profiles/`, automated inspection, comparison matrices, JSON profile export, smoke dry-runs, profile assertion validation (`bobzzite-profile-validate`), hardware profile differential analysis (`bobzzite-diff`), automated migration assistant (`bobzzite-migrate`), decentralized package mirroring (`bobzzite-ipfs`), rootless container sandboxing (`bobzzite-sandbox`), Prometheus hardware telemetry (`bobzzite-metrics`), hardware fit analysis (`bobzzite-deploy profile-analyze`), compatibility auditing (`bobzzite-compat`), hardware quirk mitigation (`bobzzite-quirks`), cryptographic signing (`bobzzite-sign`), SLSA provenance generation (`bobzzite-provenance`), security auditing (`bobzzite-security`), hardware summary reporting (`bobzzite-summary`), compatibility reporting (`bobzzite-report`), and local CI runner (`bobzzite-ci`).
- **Remote Playtesting & Streaming**: Both Moonlight/Sunshine native game streaming (`bobzzite-stream`) and zero-install WebRTC browser streaming (`bobzzite-webrtc`) with integrated HTML5 gamepad test client generation (`bobzzite-webrtc generate-client`) and remote web administration with live compute and network dual-trace graphs (`bobzzite-webdash`).
- **Asset, Packaging, Audio, & Test Pipelines**: Low-latency PipeWire quantum configurations, asset compression, gettext translation compilations, GDScript syntax validation, and SCons custom Godot export template builds.

---

## 2. Active Utilities Catalog

All utilities are located in `scripts/` and mirrored in `config/files/usr/local/bin/`:
1. `bobzzite-control-center`: Main unified desktop GUI with hardware comparison, profile validation, fit analysis, compatibility auditing, multi-arch targets, hardware quirks, web dashboard, signature verification, supply-chain provenance, PR preview builds, security audit, live telemetry, network I/O, hardware profiles catalog, hardware profile summary, compatibility report, CI runner, and WebRTC streaming integration.
2. `bobzzite-tray`: System tray daemon with quick actions and server termination controls.
3. `bobzzite-doctor`: Comprehensive system diagnostics and configuration auditor.
4. `bobzzite-flavors` / `bobzzite-build-flavors`: Multi-hardware flavor build engine with `inspect`, `compare`, `export-profile`, `matrix-test`, `multi-arch`, and `config` actions.
5. `bobzzite-profile-validate`: Hardware profile assertion and constraint validator consuming `hardware_profiles/`.
6. `bobzzite-summary`: Comprehensive hardware profile matrix and documentation summary generator.
7. `bobzzite-report`: Comprehensive hardware compatibility and diagnostic report generator.
8. `bobzzite-provenance`: Software supply-chain SPDX SBOM and SLSA Level 3 provenance generator.
9. `bobzzite-diff`: Hardware profile differential analyzer for granular side-by-side spec comparisons.
10. `bobzzite-migrate`: Automated hardware migration assistant coordinating pre-flight checks and rebasing.
11. `bobzzite-ipfs`: Decentralized package mirror and P2P layer synchronization engine.
12. `bobzzite-sandbox`: Rootless container pod sandboxing engine with memory and CPU constraints.
13. `bobzzite-metrics`: Prometheus hardware and playtest telemetry exporter.
14. `bobzzite-compat`: Broad hardware compatibility and tier auditor.
13. `bobzzite-quirks`: Hardware device quirks and runtime workaround manager.
14. `bobzzite-security`: Security hardening, SUID binary, and sandbox auditor.
15. `bobzzite-webdash`: Lightweight remote web dashboard server with live vector graphs.
16. `bobzzite-sign`: Cryptographic container image signature and provenance verifier.
17. `bobzzite-preview`: Ephemeral PR preview image tag generator and staging manager.
18. `bobzzite-ci`: Local automated CI smoke test pipeline runner.
19. `bobzzite-hardware-audit`: ACPI sleep, DRM leasing, and controller hardware compliance auditor.
20. `bobzzite-validate`: Repository integrity and build readiness validator.
21. `bobzzite-package`: Headless Godot game packager and AppImage bundler.
22. `bobzzite-export-templates`: SCons-based Godot export template builder.
23. `bobzzite-test`: Headless GDScript syntax validator and game unit tester.
24. `bobzzite-assets`: Lossless texture and audio transcoding pipeline.
25. `bobzzite-i18n`: Multi-language CSV to GNU gettext compiler.
26. `bobzzite-audio`: PipeWire low-latency quantum buffer management.
27. `bobzzite-bench`: CPU, disk I/O, and Vulkan GPU benchmarking.
28. `bobzzite-stream`: Sunshine host and Moonlight client manager.
29. `bobzzite-webrtc`: WebRTC browser remote streaming gateway and HTML5 client generator.
30. `bobzzite-vr`: Monado OpenXR and Wayland DRM display lease manager.
31. `bobzzite-tweak`: Kernel sysctl, ZRAM, and power-profile optimizer.
32. `bobzzite-clean`: Flatpak cache and temporary directory cleaner.
33. `bobzzite-deploy`: Hardware detection, profile fit analysis, and atomic rebase assistant.
34. `bobzzite-gamepad`: Gamepad input event listener and latency tester.
35. `bobzzite-backup`: Btrfs/ostree config snapshot and rollback utility.
36. `bobzzite-devbox`: Containerized distrobox environment launcher.
37. `bobzzite-onboarding`: First-boot interactive walkthrough.
38. `bobzzite-mesh`: Peer-to-peer multiplayer testing mesh.
39. `bobzzite-iso`: Universal Blue ISO build wrapper.

---

## 3. Resume Instructions for Successor Models

To resume work without friction:
1. Run `python3 scripts/validate_build.py` to confirm all 44 scripts and 46 documentation guides pass syntax and path checks.
2. Run `docker build --check -f Containerfile .` to verify containerfile syntax.
3. Consult `TODO.md` and `ROADMAP.md` for upcoming enhancements.
