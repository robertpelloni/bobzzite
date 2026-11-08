# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [5.2.0] - 2025-05-18

### Added
- **Automated Hardware Quirk & Device Workaround Engine (`bobzzite-quirks`)**:
  - Implemented `scripts/bobzzite-quirks.sh` to probe host DMI product identifiers and apply device mitigations (Steam Deck portrait orientation, ASUS ROG Ally Smart Amp sleep fix, Lenovo Legion Go controller unbinding, NVIDIA Wayland sync).
  - Authored comprehensive guide in `docs/HARDWARE_QUIRKS.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Quirks" button under Hardware & Gaming Profiles card with real-time logs and tooltips.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 33 scripts and 30 technical documentation guides.

---

## [5.1.0] - 2025-05-18

### Added
- **Browser-Based Remote WebRTC Gamepad Test Client**:
  - Enhanced `scripts/bobzzite-webrtc.sh` with `generate-client` action producing a zero-install HTML5/JavaScript playtest client (`/tmp/bobzzite-webrtc-client/index.html`) featuring analog stick polling, HTML5 gamepad status indicators, and low-latency canvas rendering.
  - Authored comprehensive guide in `docs/WEBRTC_CLIENT_GUIDE.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Generate WebRTC Client" button under Hardware & Gaming Profiles card.

---

## [5.0.0] - 2025-05-18 - MILESTONE RELEASE 5.0

### Added
- **Multi-Architecture Target Profiles (x86_64 & ARM64)**:
  - Enhanced `scripts/build-flavors.sh` with ARM64 cross-compilation support (`bobzzite-arm64`) targeting Qualcomm Snapdragon X Elite laptops, Rockchip RK3588 SBCs, and Raspberry Pi 5.
  - Added `multi-arch` action to inspect supported CPU architectures (`linux/amd64`, `linux/arm64`) and build requirements (QEMU binfmt & Docker Buildx).
