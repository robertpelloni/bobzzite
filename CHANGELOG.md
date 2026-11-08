# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

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
