# Bobzzite OS - Master Roadmap

## Phase 1: Core Distribution & Indie Dev Integration (Completed - v0.1.0 to v1.9.0)
- [x] Establish automated immutable OS build infrastructure using Universal Blue.
- [x] Package and preconfigure Godot 4, VS Codium, Blender, Aseprite, LMMS, Audacity, and Krita.
- [x] Configure automated bidirectional LSP & DAP debugging between Godot and VS Codium.
- [x] Design custom Plymouth boot splash, SDDM login screen, and terminal fastfetch branding.
- [x] Deliver single-window unified `bobzzite-control-center` with system tray companion `bobzzite-tray`.

## Phase 2: Performance, Diagnostics & Hardware Workflows (Completed - v2.0.0 to v3.4.0)
- [x] Low-latency PipeWire audio subsystem with 64/128/256/512 buffer presets (`bobzzite-audio`).
- [x] Comprehensive CPU, I/O, and Vulkan GPU hardware benchmarking (`bobzzite-bench`).
- [x] Automated system cleanup and Flatpak cache management (`bobzzite-clean`).
- [x] Automatic hardware detection and atomic rebase assistant (`bobzzite-deploy`).
- [x] Sunshine and Moonlight low-latency game streaming suite (`bobzzite-stream`).
- [x] Headless Godot 4 export and AppImage bundler (`bobzzite-package`).
- [x] Monado OpenXR runtime switcher and Wayland DRM lease manager (`bobzzite-vr`).
- [x] Lossless asset pipeline for texture optimization and audio transcoding (`bobzzite-assets`).
- [x] Multi-language translation compiler (`bobzzite-i18n`).
- [x] Headless GDScript automated unit testing framework (`bobzzite-test`).

## Phase 3: Hardware Flavors, Custom Templates & Compliance (Completed - v3.5.0 to v4.9.0)
- [x] Multi-target build engine (`scripts/build-flavors.sh`) supporting `bobzzite`, `bobzzite-deck`, and `bobzzite-nvidia`.
- [x] Headless SCons Godot export template builder (`bobzzite-export-templates`).
- [x] System compliance & hardware QA auditor (`bobzzite-hardware-audit`).
- [x] Deep flavor inspector (`bobzzite-build-flavors all inspect`) integrated into Control Center.
- [x] Side-by-side hardware comparison and JSON profile export (`bobzzite-build-flavors all compare`).
- [x] WebRTC zero-install browser streaming gateway (`bobzzite-webrtc`).
- [x] Full hardware configuration matrix specification (`docs/HARDWARE_CONFIG_MATRIX.md`).
- [x] Hardware profile assertion & validation engine (`bobzzite-profile-validate`).
- [x] Hardware profile analysis & fit scoring engine (`bobzzite-deploy profile-analyze`).
- [x] Broad hardware compatibility matrix auditor (`bobzzite-compat`).
- [x] Automated GitHub Actions CI workflow & local runner (`bobzzite-ci`).
- [x] ISO generation pipeline via Universal Blue isogenerator (`bobzzite-iso`).

## Phase 4: Multi-Architecture & Cloud Native Distribution (Completed - v5.0.0 to v5.8.0)
- [x] Multi-architecture container image builds for ARM64 (`bobzzite-arm64` for Snapdragon X Elite / Rockchip RK3588).
- [x] Comprehensive multi-arch build guide (`docs/MULTI_ARCH_BUILDS.md`) and Control Center integration.
- [x] Zero-install HTML5/JS WebRTC playtest client page generator (`bobzzite-webrtc generate-client`) and guide (`docs/WEBRTC_CLIENT_GUIDE.md`).
- [x] Automated hardware quirk and device workaround engine (`bobzzite-quirks`) and guide (`docs/HARDWARE_QUIRKS.md`).
- [x] Lightweight remote web dashboard server (`bobzzite-webdash`) and guide (`docs/REMOTE_WEB_DASHBOARD.md`).
- [x] Cryptographic container image signing and verification engine (`bobzzite-sign`) and guide (`docs/IMAGE_SIGNING_VERIFICATION.md`).
- [x] Ephemeral PR preview and staging build engine (`bobzzite-preview`) and guide (`docs/EPHEMERAL_PREVIEW_BUILDS.md`).
- [x] Version-controlled hardware profiles directory (`hardware_profiles/`) and catalog guide (`docs/HARDWARE_PROFILES_CATALOG.md`).
- [x] Automated security vulnerability and container hardening auditor (`bobzzite-security`) and guide (`docs/SECURITY_AUDITING.md`).
- [x] Live hardware performance telemetry graphs and guide (`docs/HARDWARE_TELEMETRY.md`).
- [x] Comprehensive hardware profile summary matrix generator (`bobzzite-summary`) and guide (`docs/HARDWARE_PROFILE_SUMMARY.md`).
