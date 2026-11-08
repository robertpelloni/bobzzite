# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [6.0.0] - 2025-05-18 - MILESTONE RELEASE 6.0

### Added
- **Network Bandwidth & Streaming Bitrate Telemetry**:
  - Enhanced `scripts/bobzzite-webdash.py` with real-time RX/TX network byte delta calculations and dual-trace HTML5 vector canvas line graphs.
  - Authored comprehensive guide in `docs/NETWORK_TELEMETRY.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Network I/O Telemetry" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 38 scripts and 39 technical documentation guides.

---

## [5.9.0] - 2025-05-18

### Added
- **Automated Hardware Compatibility Reporter (`bobzzite-report`)**:
  - Implemented `scripts/bobzzite-report.sh` to compile an end-to-end hardware compatibility audit combining DMI signatures, CPU microcode, GPU DRM render nodes, and audio latency.
  - Authored comprehensive guide in `docs/HARDWARE_COMPATIBILITY_REPORT.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Compatibility Report" button under Hardware & Gaming Profiles card.

---

## [5.8.0] - 2025-05-18

### Added
- **Comprehensive Hardware Profile Summary Matrix Generator (`bobzzite-summary`)**:
  - Implemented `scripts/bobzzite-summary.sh` to aggregate all version-controlled specifications in `hardware_profiles/`.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILE_SUMMARY.md`.
