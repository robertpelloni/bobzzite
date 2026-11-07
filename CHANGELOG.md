# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [4.5.0] - 2025-05-18

### Added
- **Multi-Flavor Hardware Configuration Matrix & Specification**:
  - Authored comprehensive hardware specification guide in `docs/HARDWARE_CONFIG_MATRIX.md` detailing kernel command-line parameters, compositors, display leasing, and driver stacks.
  - Updated `docs/HARDWARE_FLAVORS.md` and `docs/DEPLOY.md` with complete hardware matrix routing for AMD, Intel, Handheld APUs, and NVIDIA GeForce workstations.
- **WebRTC Browser Remote Streaming Gateway**:
  - Implemented `scripts/bobzzite-webrtc.sh` (mirrored in `config/files/usr/local/bin/bobzzite-webrtc`) for zero-install, browser-based remote playtest streaming.
  - Authored complete WebRTC architecture and port specification in `docs/WEBRTC_STREAMING.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated one-click "WebRTC Stream" probe button under the Hardware & Gaming Profiles section with live terminal output and tooltips.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 29 scripts and 23 technical documentation guides.

---

## [4.4.0] - 2025-05-18

### Added
- **Hardware Profile Comparison & JSON Export**:
  - Added `compare` action to `scripts/build-flavors.sh` producing a side-by-side capability and driver stack matrix across `bobzzite`, `bobzzite-deck`, and `bobzzite-nvidia`.
  - Added `export-profile` action to `scripts/build-flavors.sh` outputting structured JSON profiles for CI pipelines and automated system configuration.
  - Authored comprehensive comparison guide in `docs/HARDWARE_MATRIX_COMPARISON.md`.
- **Bobzzite Control Center GUI**:
  - Integrated one-click "Compare Profiles" button under the Hardware Flavors card with real-time log output and informative tooltips.
- **System Binaries**:
  - Mirrored updated flavor and control center scripts in `config/files/usr/local/bin/`.

---

## [4.3.0] - 2025-05-18

### Added
- **Multi-Flavor Hardware Profile Inspector**:
  - Enhanced `scripts/build-flavors.sh` with the `inspect` action to provide detailed hardware acceleration, target driver stack, and compositor telemetry across all three hardware targets (`bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`).
  - Added `docs/HARDWARE_PROFILES_INTEGRATION.md` detailing hardware flavor inspection workflows and CI integration.
- **Control Center Integration**:
  - Connected the new flavor inspection routine to the **Bobzzite Control Center** unified dashboard.
- **Build Validation**:
  - Updated `scripts/validate_build.py` to continuously verify the presence and formatting of hardware profile documentation.
