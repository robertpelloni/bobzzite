# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

---

## [4.4.0] - 2025-05-18

### Added
- **Hardware Profile Comparison & JSON Export**:
  - Added `compare` action to `scripts/build-flavors.sh` producing a side-by-side capability and driver stack matrix across `bobzzite`, `bobzzite-deck`, and `bobzzite-nvidia`.
  - Added `export-profile` action to `scripts/build-flavors.sh` outputting structured JSON profiles for CI pipelines and automated system configuration.
  - Authored comprehensive comparison guide in `docs/HARDWARE_MATRIX_COMPARISON.md`.
- **Bobzzite Control Center GUI**:
  - Integrated one-click "Compare Profiles" button under the Hardware Flavors card with real-time log output and informative tooltips.
- **System Binaries**:
  - Mirrored updated flavor and control center scripts in `config/files/usr/local/bin/`.

---

## [4.3.0] - 2025-05-18

### Added
- **Multi-Flavor Hardware Profile Inspector**:
  - Enhanced `scripts/build-flavors.sh` with the `inspect` action to provide detailed hardware acceleration, target driver stack, and compositor telemetry across all three hardware targets (`bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`).
  - Added `docs/HARDWARE_PROFILES_INTEGRATION.md` detailing hardware flavor inspection workflows and CI integration.
- **Control Center Integration**:
  - Connected the new flavor inspection routine to the **Bobzzite Control Center** unified dashboard.
- **Build Validation**:
  - Updated `scripts/validate_build.py` to continuously verify the presence and formatting of hardware profile documentation.

---

## [4.2.0] - 2025-05-18

### Added
- **Hardware Compliance & Matrix Suite**:
  - Added `bobzzite-hardware-audit` for validating ACPI suspend/resume, DRM leasing, and controller input nodes (`docs/HARDWARE_COMPLIANCE.md`).
  - Added GDExtension C++ SDK development workflow guide in `docs/GDEXTENSION_GUIDE.md`.
  - Added comprehensive CLI cheatsheet in `docs/QUICK_REFERENCE.md`.
