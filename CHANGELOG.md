# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

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
