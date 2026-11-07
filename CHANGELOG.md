# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [4.8.0] - 2025-05-18

### Added
- **Broad Hardware Compatibility Auditor (`bobzzite-compat`)**:
  - Implemented `scripts/bobzzite-compat.sh` to audit CPU microcode, instruction set extensions (SSE4.2, AVX, AVX2, FMA3), GPU rendering nodes, PipeWire pro-audio buffers, and assign system compatibility tiers.
  - Authored comprehensive guide in `docs/HARDWARE_COMPATIBILITY_MATRIX.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Hardware Compatibility" action button under Hardware & Gaming Profiles card with real-time logs and tooltips.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 31 scripts and 26 technical documentation guides.

---

## [4.7.0] - 2025-05-18

### Added
- **Hardware Profile Analysis & Suitability Scoring**:
  - Enhanced `scripts/bobzzite-deploy.sh` with `profile-analyze` action to probe live system specs (DMI product, CPU cores, GPU PCI vendor codes, DRM nodes) and compute fit percentage across flavors.
  - Authored comprehensive guide in `docs/HARDWARE_PROFILE_ANALYSIS.md`.
- **Bobzzite Control Center GUI**:
  - Integrated "Profile Analysis" button into Hardware & Gaming Profiles card.

---

## [4.6.0] - 2025-05-18

### Added
- **Hardware Profile Validation & Assertion Engine**:
  - Implemented `scripts/bobzzite-profile-validate.sh` to test generated hardware profiles against architectural constraints.
  - Authored validation documentation and CI guidelines in `docs/HARDWARE_PROFILE_VALIDATION.md`.
- **Bobzzite Control Center GUI**:
  - Integrated "Validate Profiles" action button under the Hardware & Gaming Profiles card with real-time log output and tooltips.
