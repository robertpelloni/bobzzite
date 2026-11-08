# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [5.7.0] - 2025-05-18

### Added
- **Live Hardware Performance Telemetry Graphs**:
  - Enhanced `scripts/bobzzite-webdash.py` with HTML5 Canvas live telemetry line graph rendering, load average ring buffering, and thermal zone Celsius reporting.
  - Authored comprehensive guide in `docs/HARDWARE_TELEMETRY.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Live Telemetry" button under Hardware & Gaming Profiles card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 36 scripts and 36 technical documentation guides.

---

## [5.6.0] - 2025-05-18

### Added
- **Automated Security & Container Hardening Auditor (`bobzzite-security`)**:
  - Implemented `scripts/bobzzite-security.sh` to audit read-only ostree root immutability, SUID/SGID elevated binary counts, SELinux policy modes, and Flatpak application sandbox boundaries.
  - Authored comprehensive guide in `docs/SECURITY_AUDITING.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Security Audit" button under System Updates & Diagnostics.

---

## [5.5.0] - 2025-05-18

### Added
- **Version-Controlled Hardware Profiles Catalog (`hardware_profiles/`)**:
  - Established dedicated `hardware_profiles/` directory tracking JSON specifications for `bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`, and `bobzzite-arm64`.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILES_CATALOG.md`.
