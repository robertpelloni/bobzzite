# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [4.7.0] - 2025-05-18

### Added
- **Hardware Profile Analysis & Suitability Scoring**:
  - Enhanced `scripts/bobzzite-deploy.sh` with `profile-analyze` action to probe live system specs (DMI product, CPU cores, GPU PCI vendor codes, DRM nodes) and compute fit percentage across flavors.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILE_ANALYSIS.md`.
- **Bobzzite Control Center GUI**:
  - Integrated "Profile Analysis" button into Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 30 scripts and 25 technical documentation guides.

---

## [4.6.0] - 2025-05-18

### Added
- **Hardware Profile Validation & Assertion Engine**:
  - Implemented `scripts/bobzzite-profile-validate.sh` (mirrored to `config/files/usr/local/bin/bobzzite-profile-validate`) to test generated hardware profiles against architectural constraints (compositor, driver stack, encoders, audio buffer).
  - Authored validation documentation and CI guidelines in `docs/HARDWARE_PROFILE_VALIDATION.md`.
- **Bobzzite Control Center GUI**:
  - Integrated "Validate Profiles" action button under the Hardware & Gaming Profiles card with real-time log output and tooltips.

---

## [4.5.0] - 2025-05-18

### Added
- **Multi-Flavor Hardware Configuration Matrix & Specification**:
  - Authored comprehensive hardware specification guide in `docs/HARDWARE_CONFIG_MATRIX.md` detailing kernel command-line parameters, compositors, display leasing, and driver stacks.
  - Updated `docs/HARDWARE_FLAVORS.md` and `docs/DEPLOY.md` with complete hardware matrix routing for AMD, Intel, Handheld APUs, and NVIDIA GeForce workstations.
- **WebRTC Browser Remote Streaming Gateway**:
  - Implemented `scripts/bobzzite-webrtc.sh` (mirrored in `config/files/usr/local/bin/bobzzite-webrtc`) for zero-install, browser-based remote playtest streaming.
  - Authored complete WebRTC architecture and port specification in `docs/WEBRTC_STREAMING.md`.
