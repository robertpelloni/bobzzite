# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [5.4.0] - 2025-05-18

### Added
- **Cryptographic Container Image Signing & Verification (`bobzzite-sign`)**:
  - Implemented `scripts/bobzzite-sign.sh` (mirrored to `config/files/usr/local/bin/bobzzite-sign`) providing Cosign/Sigstore keyless verification, transparency log checks, and policy generation.
  - Authored comprehensive guide in `docs/IMAGE_SIGNING_VERIFICATION.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Verify Image Signatures" button under System Updates & Diagnostics with real-time logging and tooltips.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 34 scripts and 32 technical documentation guides.

---

## [5.3.0] - 2025-05-18

### Added
- **Remote Web Dashboard Management Engine (`bobzzite-webdash`)**:
  - Implemented `scripts/bobzzite-webdash.py` providing a dependency-free HTTP dashboard server for remote hardware monitoring, host metrics, and diagnostics.
  - Authored comprehensive guide in `docs/REMOTE_WEB_DASHBOARD.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Web Dashboard" button under System Updates & Diagnostics with real-time logging and tooltips.

---

## [5.2.0] - 2025-05-18

### Added
- **Automated Hardware Quirk & Device Workaround Engine (`bobzzite-quirks`)**:
  - Implemented `scripts/bobzzite-quirks.sh` to probe host DMI product identifiers and apply device mitigations.
  - Authored comprehensive guide in `docs/HARDWARE_QUIRKS.md`.
