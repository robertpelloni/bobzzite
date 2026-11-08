# Bobzzite OS Changelog

All notable changes to the Bobzzite OS distribution are documented here.
This project adheres to Semantic Versioning and tracks a unified single source of truth in `VERSION.md`.

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
- **Bobzzite Control Center GUI Integration**:
  - Added "Hardware Profiles Catalog" button under Hardware & Gaming Profiles card.
  - Added "Staging / PR Builds" button under System Updates & Diagnostics card.
- **Continuous Validation**:
  - Updated `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate` to continuously verify all 35 scripts and 34 technical documentation guides.

---

## [5.4.0] - 2025-05-18

### Added
- **Cryptographic Container Image Signing & Verification (`bobzzite-sign`)**:
  - Implemented `scripts/bobzzite-sign.sh` for Cosign/Sigstore image signature verification, public key inspection, and container policy generation.
  - Authored comprehensive guide in `docs/IMAGE_SIGNING_VERIFICATION.md`.
- **Bobzzite Control Center GUI Integration**:
  - Added dedicated "Verify Image Signatures" button under System Updates & Diagnostics.
