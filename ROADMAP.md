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

## Phase 3: Hardware Flavors, Custom Templates & Compliance (Completed - v3.5.0 to v4.4.0)
- [x] Multi-target build engine (`scripts/build-flavors.sh`) supporting `bobzzite`, `bobzzite-deck`, and `bobzzite-nvidia`.
- [x] Headless SCons Godot export template builder (`bobzzite-export-templates`).
- [x] System compliance & hardware QA auditor (`bobzzite-hardware-audit`).
- [x] Deep flavor inspector (`bobzzite-build-flavors all inspect`) integrated into Control Center.
- [x] Side-by-side hardware comparison and JSON profile export (`bobzzite-build-flavors all compare`).
- [x] ISO generation pipeline via Universal Blue isogenerator (`bobzzite-iso`).

## Phase 4: Cloud CI & Multi-Architecture Targets (Upcoming)
- [ ] Automated multi-arch container image builds for ARM64 (Snapdragon X Elite / Rockchip RK3588).
- [ ] Continuous integration automated image artifact publishing to GitHub Container Registry (`ghcr.io/robertpelloni/bobzzite`).
- [ ] Integration of remote web dashboard for headless workstation management.
