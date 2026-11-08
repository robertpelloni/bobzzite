# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

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
