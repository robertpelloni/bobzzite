# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [5.0.0] - 2025-05-18 - MILESTONE RELEASE 5.0

### Added
- **Multi-Architecture Target Profiles (x86_64 & ARM64)**:
  - Enhanced `scripts/build-flavors.sh` with ARM64 cross-compilation support (`bobzzite-arm64`) targeting Qualcomm Snapdragon X Elite laptops, Rockchip RK3588 SBCs, and Raspberry Pi 5.
  - Added `multi-arch` action to inspect supported CPU architectures (`linux/amd64`, `linux/arm64`) and build requirements (QEMU binfmt & Docker Buildx).
  - Authored comprehensive guide in `docs/MULTI_ARCH_BUILDS.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Multi-Arch Targets" action button under Hardware & Gaming Profiles card with real-time logs and tooltips.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 32 scripts and 28 technical documentation guides.

---

## [4.9.0] - 2025-05-18

### Added
- **Automated CI/CD Workflow & GitHub Actions Matrix Testing**:
  - Implemented `scripts/bobzzite-ci.sh` for reproducible local CI validation.
  - Enhanced `.github/workflows/build.yml` with automated matrix validation, profile assertion checks, and container image builds across all three hardware targets.
  - Authored comprehensive guide in `docs/CONTINUOUS_INTEGRATION.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Run CI Smoke Suite" button under System Updates & Diagnostics with live logging and tooltips.

---

## [4.8.0] - 2025-05-18

### Added
- **Broad Hardware Compatibility Auditor (`bobzzite-compat`)**:
  - Implemented `scripts/bobzzite-compat.sh` to audit CPU microcode, instruction set extensions (SSE4.2, AVX, AVX2, FMA3), GPU rendering nodes, PipeWire pro-audio buffers, and assign system compatibility tiers.
  - Authored comprehensive guide in `docs/HARDWARE_COMPATIBILITY_MATRIX.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Compatibility" action button under Hardware & Gaming Profiles card with real-time logs and tooltips.
