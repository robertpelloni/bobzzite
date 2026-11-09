# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [8.5.0] - 2025-05-18

### Added
- **Memory-Mapped Shared Buffer Diagnostics Engine (`bobzzite-shm`)**:
  - Implemented `scripts/bobzzite-shm.sh` (mirrored to `config/files/usr/local/bin/bobzzite-shm`) auditing POSIX shared memory (`/dev/shm`), Wayland `wl_shm` buffer pools, PipeWire locked ring buffers, and Linux kernel `dma-buf` zero-copy texture sharing pipelines.
  - Authored comprehensive guide in `docs/SHARED_MEMORY_PIPELINE.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Shared Memory & Zero-Copy" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-shm.sh` and `SHARED_MEMORY_PIPELINE.md`.

---

## [8.4.0] - 2025-05-18

### Added
- **Handheld Gyro & Motion Sensor Calibrator (`bobzzite-gyro`)**:
  - Implemented `scripts/bobzzite-gyro.sh` (mirrored to `config/files/usr/local/bin/bobzzite-gyro`) to probe Industrial I/O (`/sys/bus/iio/devices`) and evdev motion nodes, calculate resting zero-rate bias drift offsets, and generate calibration profiles.
  - Authored comprehensive guide in `docs/HANDHELD_GYRO_CALIBRATION.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Handheld Gyro & Motion" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-gyro.sh` and `HANDHELD_GYRO_CALIBRATION.md`.

---

## [8.0.0] - 2025-05-18 - MAJOR MILESTONE RELEASE 8.0

### Added
- **CPU Microcode & Hardware Mitigation Auditor (`bobzzite-microcode`)**:
  - Implemented `scripts/bobzzite-microcode.sh` (mirrored to `config/files/usr/local/bin/bobzzite-microcode`) to audit active CPU microcode levels, processor family/model/stepping, and early-loading mechanisms.
  - Audits kernel sysfs vulnerability mitigations across all vectors (`/sys/devices/system/cpu/vulnerabilities/`) including Downfall, Spectre, Meltdown, MDS, Retbleed, and SRBDS.
  - Authored comprehensive architecture and mitigation guide in `docs/CPU_MICROCODE_MANAGEMENT.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "CPU Microcode & Mitigations" button under System Maintenance & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-microcode.sh` and `CPU_MICROCODE_MANAGEMENT.md`.

---

## [7.9.0] - 2025-05-18

### Added
- **Hardware Profile Summary & Compliance Data Matrix**:
  - Authored comprehensive reference catalog in `docs/HARDWARE_PROFILE_SUMMARY_DATA.md` documenting aggregated specs, driver stacks, video encoders, audio buffers, and compliance tiers across all four target flavors (`bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`, `bobzzite-arm64`).
  - Added direct reference linkage in `docs/HARDWARE_PROFILE_SUMMARY.md`.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `HARDWARE_PROFILE_SUMMARY_DATA.md`.

---

## [7.8.0] - 2025-05-18

### Added
- **Battery Health & Charge Threshold Optimizer (`bobzzite-battery`)**:
  - Implemented `scripts/bobzzite-battery.sh` (mirrored to `config/files/usr/local/bin/bobzzite-battery`) querying power supply sysfs attributes, cycle degradation retention, and setting charging stop-thresholds (80%) to maximize cell longevity.
  - Authored comprehensive guide in `docs/BATTERY_HEALTH_MANAGEMENT.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Battery Health & Charging" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-battery.sh` and `BATTERY_HEALTH_MANAGEMENT.md`.

---

## [7.7.0] - 2025-05-18

### Added
- **Wayland Color Management & HDR Calibration (`bobzzite-hdr`)**:
  - Implemented `scripts/bobzzite-hdr.sh` (mirrored to `config/files/usr/local/bin/bobzzite-hdr`) managing Wayland `xx-color-management-v4`, EDID HDR metadata extraction, BT.2020 WCG, and Gamescope launch flags.
  - Authored comprehensive guide in `docs/WAYLAND_HDR_SETUP.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "HDR & Color Management" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-hdr.sh` and `WAYLAND_HDR_SETUP.md`.

---

## [7.6.0] - 2025-05-18

### Added
- **Hardware Deployment Documentation & Operational Runbooks**:
  - Authored comprehensive guide in `docs/HARDWARE_DEPLOYMENT_WORKFLOWS.md` covering handheld, workstation, and air-gapped rebase procedures.
  - Fully synchronized `DEPLOY.md` and `docs/HARDWARE_DETECTION.md` with the 7-stage deployment pipeline.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Deployment Runbooks" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `HARDWARE_DEPLOYMENT_WORKFLOWS.md`.

---

## [7.5.0] - 2025-05-18

### Added
- **Hardware Deployment Compliance & Profile Assertion Bridge**:
  - Enhanced `scripts/bobzzite-deploy.sh` (mirrored to `config/files/usr/local/bin/bobzzite-deploy`) by bridging `profile-audit` (`bobzzite-hardware-audit`) and `profile-validate` (`bobzzite-profile-validate`) directly into deployment workflows.
  - Authored comprehensive guide in `docs/HARDWARE_DEPLOY_COMPLIANCE.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Deploy Compliance Audit" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `HARDWARE_DEPLOY_COMPLIANCE.md`.

---

## [7.4.0] - 2025-05-18

### Added
- **eBPF Low-Latency Packet Routing Optimizer (`bobzzite-ebpf`)**:
  - Implemented `scripts/bobzzite-ebpf.sh` (mirrored to `config/files/usr/local/bin/bobzzite-ebpf`) managing XDP driver fastpaths, multiplayer UDP packet bypass, and packet statistics.
  - Authored comprehensive guide in `docs/EBPF_NETWORKING.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "eBPF Network Optimizer" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-ebpf.sh` and `EBPF_NETWORKING.md`.

---

## [7.3.0] - 2025-05-18

### Added
- **Multi-Hardware Matrix Coverage Auditor (`bobzzite-coverage`)**:
  - Implemented `scripts/bobzzite-coverage.sh` (mirrored to `config/files/usr/local/bin/bobzzite-coverage`) validating 100% matrix completeness across specifications, container image embedding, and build targets.
  - Authored comprehensive guide in `docs/HARDWARE_COVERAGE_AUDIT.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Coverage Audit" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-coverage.sh` and `HARDWARE_COVERAGE_AUDIT.md`.

---

## [7.2.0] - 2025-05-18

### Added
- **Hardware Profile Comparison & Inspector Integration in `bobzzite-deploy`**:
  - Enhanced `scripts/bobzzite-deploy.sh` (mirrored to `config/files/usr/local/bin/bobzzite-deploy`) with `profile-inspect` and `profile-compare` subcommands.
  - Authored comprehensive guide in `docs/HARDWARE_DEPLOY_PROFILES.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Inspect Target Profile" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `HARDWARE_DEPLOY_PROFILES.md`.

---

## [7.1.0] - 2025-05-18

### Added
- **Godot 4 Shader Pre-Compilation Cache Manager (`bobzzite-shader-cache`)**:
  - Implemented `scripts/bobzzite-shader-cache.sh` (mirrored to `config/files/usr/local/bin/bobzzite-shader-cache`) to pre-warm, inspect, and bundle Vulkan SPIR-V shader pipeline caches, eliminating in-game micro-stutters.
  - Authored comprehensive guide in `docs/SHADER_CACHE_MANAGEMENT.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "🔥 Pre-warm Shader Cache" button under High-Value Quick Actions panel.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-shader-cache.sh` and `SHADER_CACHE_MANAGEMENT.md`.

---

## [7.0.0] - 2025-05-18 - MILESTONE RELEASE 7.0

### Added
- **Zero-Trust Kernel Lockdown & Secure Boot Validator (`bobzzite-lockdown`)**:
  - Implemented `scripts/bobzzite-lockdown.sh` (mirrored to `config/files/usr/local/bin/bobzzite-lockdown`) auditing EFI Secure Boot state, kernel lockdown mode (`integrity` / `confidentiality`), unsigned kernel modules, and IOMMU DMA device isolation.
  - Authored comprehensive guide in `docs/KERNEL_LOCKDOWN.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Kernel Lockdown & Security" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-lockdown.sh` and `KERNEL_LOCKDOWN.md`.

---

## [6.9.0] - 2025-05-18

### Added
- **OpenXR Eye-Tracking Calibration & Dynamic Foveated Rendering (`bobzzite-eye-track`)**:
  - Implemented `scripts/bobzzite-eye-track.sh` (mirrored to `config/files/usr/local/bin/bobzzite-eye-track`) managing `XR_EXT_eye_gaze_interaction` extensions, 5-point calibration matrix, and Vulkan Tier 2 VRS dynamic foveated rendering.
  - Authored comprehensive guide in `docs/VR_EYE_TRACKING.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "XR Eye Tracking" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-eye-track.sh` and `VR_EYE_TRACKING.md`.

---

## [6.8.0] - 2025-05-18

### Added
- **Automated CI Benchmark Regression Gatekeeper (`bobzzite-bench-gate`)**:
  - Implemented `scripts/bobzzite-bench-gate.sh` (mirrored to `config/files/usr/local/bin/bobzzite-bench-gate`) enforcing performance baseline SLAs and checking for CPU/IO regressions.
  - Authored comprehensive guide in `docs/BENCHMARK_GATEKEEPER.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Benchmark Gatekeeper" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `bobzzite-bench-gate.sh` and `BENCHMARK_GATEKEEPER.md`.

---

## [6.7.0] - 2025-05-18

### Added
- **Hardware Profile Comparison Data Matrix (`HARDWARE_PROFILE_COMPARISON_DATA.md`)**:
  - Extracted comprehensive differential matrix artifacts comparing `bobzzite` against `bobzzite-deck`, `bobzzite-nvidia`, and `bobzzite-arm64`.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILE_COMPARISON_DATA.md`.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `bobzzite-validate` to continuously verify `HARDWARE_PROFILE_COMPARISON_DATA.md`.

---

## [6.6.0] - 2025-05-18

### Added
- **Automated Telemetry Prometheus Exporter Gateway (`bobzzite-metrics`)**:
  - Implemented `scripts/bobzzite-metrics.sh` (mirrored to `config/files/usr/local/bin/bobzzite-metrics`) exposing standard Prometheus text exposition format metrics for CPU load averages, memory pressure, thermal zones, and hardware flavor tags.
  - Authored comprehensive guide in `docs/PROMETHEUS_METRICS.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Prometheus Metrics Gateway" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` to continuously verify `bobzzite-metrics.sh` and `PROMETHEUS_METRICS.md`.

---

## [6.5.0] - 2025-05-18

### Added
- **Automated Rootless Container Pod Sandboxing Engine (`bobzzite-sandbox`)**:
  - Implemented `scripts/bobzzite-sandbox.sh` (mirrored to `config/files/usr/local/bin/bobzzite-sandbox`) for running untrusted third-party game builds and mods in unprivileged Podman user namespaces with cgroups v2 resource limits (2GB RAM, 2 CPUs).
  - Authored comprehensive guide in `docs/ROOTLESS_SANDBOXING.md`.
- **System Image Profile Deployment**:
  - Embedded version-controlled hardware profile JSON catalog directly into `config/files/usr/share/bobzzite/hardware_profiles/` for offline container operation.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Rootless Sandbox" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` to continuously verify `bobzzite-sandbox.sh` and `ROOTLESS_SANDBOXING.md`.

---

## [6.4.0] - 2025-05-18

### Added
- **Decentralized Package Mirror Synchronization Engine (`bobzzite-ipfs`)**:
  - Implemented `scripts/bobzzite-ipfs.sh` (mirrored to `config/files/usr/local/bin/bobzzite-ipfs`) for P2P distribution, layer pinning, and content-addressed verification via IPFS/Kubo.
  - Authored comprehensive guide in `docs/DECENTRALIZED_MIRRORS.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "P2P / IPFS Package Mirror" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` to continuously verify `bobzzite-ipfs.sh` and `DECENTRALIZED_MIRRORS.md`.

---

## [6.3.0] - 2025-05-18

### Added
- **Hardware Profile Automated Migration Assistant (`bobzzite-migrate`)**:
  - Implemented `scripts/bobzzite-migrate.sh` (mirrored to `config/files/usr/local/bin/bobzzite-migrate`) providing a 4-phase migration workflow: hardware detection, profile differential analysis, pre-rebase state snapshots, and atomic rebase execution.
  - Authored comprehensive documentation in `docs/HARDWARE_MIGRATION_ASSISTANT.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Migration Assistant" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` to continuously verify `bobzzite-migrate.sh` and `HARDWARE_MIGRATION_ASSISTANT.md`.

---

## [6.2.0] - 2025-05-18

### Added
- **Hardware Profile Comparison Data Exporter & Differential Analyzer (`bobzzite-diff`)**:
  - Implemented `scripts/bobzzite-diff.sh` (mirrored to `config/files/usr/local/bin/bobzzite-diff`) to perform comparative differential analysis across hardware profiles in `hardware_profiles/`.
  - Supported terminal, markdown, and structured JSON output formats.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILE_DIFF.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Profile Diff Analyzer" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` to continuously verify `bobzzite-diff.sh` and `HARDWARE_PROFILE_DIFF.md`.

---

## [6.1.0] - 2025-05-18

### Added
- **Software Supply Chain Provenance & SPDX SBOM Engine (`bobzzite-provenance`)**:
  - Implemented `scripts/bobzzite-provenance.sh` (mirrored to `config/files/usr/local/bin/bobzzite-provenance`) to generate SPDX 2.3 JSON Software Bill of Materials and in-toto SLSA Level 3 provenance predicates.
  - Authored comprehensive guide in `docs/SUPPLY_CHAIN_PROVENANCE.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Supply-Chain Provenance" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 39 scripts and 40 technical documentation guides.

---

## [6.0.0] - 2025-05-18 - MILESTONE RELEASE 6.0

### Added
- **Network Bandwidth & Streaming Bitrate Telemetry**:
  - Enhanced `scripts/bobzzite-webdash.py` with real-time RX/TX network byte delta calculations and dual-trace HTML5 vector canvas line graphs.
  - Authored comprehensive guide in `docs/NETWORK_TELEMETRY.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Network I/O Telemetry" button under Hardware & Gaming Profiles card.

---

## [5.9.0] - 2025-05-18

### Added
- **Automated Hardware Compatibility Reporter (`bobzzite-report`)**:
  - Implemented `scripts/bobzzite-report.sh` to compile an end-to-end hardware compatibility audit.
  - Authored comprehensive guide in `docs/HARDWARE_COMPATIBILITY_REPORT.md`.
