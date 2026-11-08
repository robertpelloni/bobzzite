# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [5.3.0] - 2025-05-18

### Added
- **Remote Web Dashboard Management Engine (`bobzzite-webdash`)**:
  - Implemented `scripts/bobzzite-webdash.py` (mirrored to `config/files/usr/local/bin/bobzzite-webdash`) providing a dependency-free HTTP dashboard server for remote hardware monitoring, host metrics, and diagnostics.
  - Authored comprehensive guide in `docs/REMOTE_WEB_DASHBOARD.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Web Dashboard" button under System Updates & Diagnostics with real-time logging and tooltips.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 33 scripts and 31 technical documentation guides.

---

## [5.2.0] - 2025-05-18

### Added
- **Automated Hardware Quirk & Device Workaround Engine (`bobzzite-quirks`)**:
  - Implemented `scripts/bobzzite-quirks.sh` to probe host DMI product identifiers and apply device mitigations.
  - Authored comprehensive guide in `docs/HARDWARE_QUIRKS.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Quirks" button under Hardware & Gaming Profiles card.

---

## [5.1.0] - 2025-05-18

### Added
- **Browser-Based Remote WebRTC Gamepad Test Client**:
  - Enhanced `scripts/bobzzite-webrtc.sh` with `generate-client` action producing a zero-install HTML5/JavaScript playtest client.
  - Authored comprehensive guide in `docs/WEBRTC_CLIENT_GUIDE.md`.
