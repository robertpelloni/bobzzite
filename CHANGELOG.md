# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

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

---

## [4.1.0] - 2025-05-18

### Added
- **Custom Godot 4 Export Template Compiler (`bobzzite-export-templates`)**:
  - SCons automated headless build pipeline for lightweight custom game templates (`docs/EXPORT_TEMPLATES.md`).

---

## [4.0.0] - 2025-05-18

### Added
- **Comprehensive Hardware Matrix Profiles**:
  - Comprehensive performance and tuning profiles across Steam Deck, ASUS ROG Ally, Lenovo Legion Go, NVIDIA RTX Workstations, and AMD Radeon Desktops (`docs/HARDWARE_MATRIX_PROFILES.md`).

---

## [3.9.0] - 2025-05-18

### Added
- **Hardware Matrix Benchmarking & Configuration Generation**:
  - Enhanced `scripts/build-flavors.sh` with `test-matrix`, `bench-matrix`, and `config` actions (`docs/HARDWARE_MATRIX_TESTING.md`).

---

## [3.8.0] - 2025-05-18

### Added
- **Hardware Customization Engine**:
  - Introduced granular device customization guides (`docs/HARDWARE_CUSTOMIZATION.md`).

---

## [3.7.0] - 2025-05-18

### Added
- **Automated Game Unit Testing Framework (`bobzzite-test`)**:
  - Headless GDScript syntax validator and test suite runner (`docs/AUTOMATED_TESTING.md`).

---

## [3.6.0] - 2025-05-18

### Added
- **Game Localization Pipeline (`bobzzite-i18n`)**:
  - Translation compilation and GNU gettext `.mo` generation (`docs/LOCALIZATION.md`).

---

## [3.5.0] - 2025-05-18

### Added
- **Multi-Hardware Target Flavor Build Engine (`scripts/build-flavors.sh`)**:
  - Multi-target image compiler for `bobzzite`, `bobzzite-deck`, and `bobzzite-nvidia` (`docs/HARDWARE_FLAVORS.md`).
