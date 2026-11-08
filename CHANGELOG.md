# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [5.6.0] - 2025-05-18

### Added
- **Automated Security & Container Hardening Auditor (`bobzzite-security`)**:
  - Implemented `scripts/bobzzite-security.sh` (mirrored to `config/files/usr/local/bin/bobzzite-security`) to audit read-only ostree root immutability, SUID/SGID elevated binary counts, SELinux policy modes, and Flatpak application sandbox boundaries.
  - Authored comprehensive guide in `docs/SECURITY_AUDITING.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Security Audit" button under System Updates & Diagnostics with real-time logging and tooltips.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 36 scripts and 35 technical documentation guides.

---

## [5.5.0] - 2025-05-18

### Added
- **Version-Controlled Hardware Profiles Catalog (`hardware_profiles/`)**:
  - Established dedicated `hardware_profiles/` directory tracking JSON specifications for `bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`, and `bobzzite-arm64`.
  - Updated `scripts/bobzzite-profile-validate.sh` to read directly from `hardware_profiles/`.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILES_CATALOG.md`.
- **Ephemeral PR Preview & Staging Engine (`bobzzite-preview`)**:
  - Implemented `scripts/bobzzite-preview.sh` for generating preview image tags (`pr-<num>-<sha>`), validating build arguments, and providing rebase commands for testers.
  - Authored comprehensive guide in `docs/EPHEMERAL_PREVIEW_BUILDS.md`.
