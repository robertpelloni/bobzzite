# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [5.8.0] - 2025-05-18

### Added
- **Comprehensive Hardware Profile Summary Matrix Generator (`bobzzite-summary`)**:
  - Implemented `scripts/bobzzite-summary.sh` (mirrored to `config/files/usr/local/bin/bobzzite-summary`) to aggregate all version-controlled specifications in `hardware_profiles/` and output aligned terminal tables, Markdown documentation, and JSON bundles.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILE_SUMMARY.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Profile Summary" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 37 scripts and 37 technical documentation guides.

---

## [5.7.0] - 2025-05-18

### Added
- **Live Hardware Performance Telemetry Graphs**:
  - Enhanced `scripts/bobzzite-webdash.py` with HTML5 Canvas live telemetry line graph rendering, load average ring buffering, and thermal zone Celsius reporting.
  - Authored comprehensive guide in `docs/HARDWARE_TELEMETRY.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Live Telemetry" button under Hardware & Gaming Profiles card.

---

## [5.6.0] - 2025-05-18

### Added
- **Automated Security & Container Hardening Auditor (`bobzzite-security`)**:
  - Implemented `scripts/bobzzite-security.sh` to audit read-only ostree root immutability, SUID/SGID elevated binary counts, SELinux policy modes, and Flatpak application sandbox boundaries.
  - Authored comprehensive guide in `docs/SECURITY_AUDITING.md`.
