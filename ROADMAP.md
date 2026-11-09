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

## Phase 4: Multi-Architecture & Cloud Native Distribution (Completed - v5.0.0 to v5.9.0)
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
- [x] Automated hardware compatibility reporter (`bobzzite-report`) and guide (`docs/HARDWARE_COMPATIBILITY_REPORT.md`).

## Phase 5: Production Milestone & Enterprise Hardening (Milestone v6.0.0 to v6.2.0)
- [x] Real-time network bandwidth streaming telemetry and dual-trace canvas graphing (`docs/NETWORK_TELEMETRY.md`).
- [x] Software supply chain SLSA Level 3 provenance attestations and SPDX SBOM generation (`docs/SUPPLY_CHAIN_PROVENANCE.md`).
- [x] Hardware profile comparison data exporter & differential analyzer (`bobzzite-diff`, `docs/HARDWARE_PROFILE_DIFF.md`).
- [x] Hardware profile automated migration assistant (`bobzzite-migrate`, `docs/HARDWARE_MIGRATION_ASSISTANT.md`).
- [x] Decentralized package mirror synchronization over IPFS (`bobzzite-ipfs`, `docs/DECENTRALIZED_MIRRORS.md`).
- [x] Automated rootless container pod sandboxing for untrusted builds (`bobzzite-sandbox`, `docs/ROOTLESS_SANDBOXING.md`).
- [x] Automated telemetry Prometheus exporter gateway (`bobzzite-metrics`, `docs/PROMETHEUS_METRICS.md`).
- [x] Hardware profile comparison data matrices (`docs/HARDWARE_PROFILE_COMPARISON_DATA.md`).
- [x] Automated CI benchmark regression gatekeeper (`bobzzite-bench-gate`, `docs/BENCHMARK_GATEKEEPER.md`).
- [x] OpenXR eye-tracking calibration & dynamic foveated rendering (`bobzzite-eye-track`, `docs/VR_EYE_TRACKING.md`).
- [x] Zero-trust kernel module lockdown & Secure Boot validation (`bobzzite-lockdown`, `docs/KERNEL_LOCKDOWN.md`).
- [x] Godot 4 shader pre-compilation cache manager (`bobzzite-shader-cache`, `docs/SHADER_CACHE_MANAGEMENT.md`).
- [x] Hardware profile comparison & inspector integration in `bobzzite-deploy` (`docs/HARDWARE_DEPLOY_PROFILES.md`).
- [x] Multi-hardware matrix coverage auditor (`bobzzite-coverage`, `docs/HARDWARE_COVERAGE_AUDIT.md`).
- [x] eBPF low-latency packet routing optimizer (`bobzzite-ebpf`, `docs/EBPF_NETWORKING.md`).
- [x] Hardware deployment compliance & profile assertion bridge (`docs/HARDWARE_DEPLOY_COMPLIANCE.md`).
- [x] Hardware deployment runbooks & operational workflows (`docs/HARDWARE_DEPLOYMENT_WORKFLOWS.md`).
- [x] Wayland color management & HDR calibration (`bobzzite-hdr`, `docs/WAYLAND_HDR_SETUP.md`).
- [x] Battery health & charge threshold optimizer (`bobzzite-battery`, `docs/BATTERY_HEALTH_MANAGEMENT.md`).
- [x] Comprehensive hardware profile summary & compliance data catalog (`docs/HARDWARE_PROFILE_SUMMARY_DATA.md`).
- [x] CPU microcode & hardware mitigation auditor (`bobzzite-microcode`, `docs/CPU_MICROCODE_MANAGEMENT.md`).
- [x] Vulkan ray tracing pipeline & capability auditor (`bobzzite-raytracing`, `docs/VULKAN_RAYTRACING.md`).
- [ ] Implement adaptive thermal fan curve manager for gaming handhelds (`bobzzite-fan`).
