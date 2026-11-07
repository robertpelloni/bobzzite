# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v4.4.0 Release Verification & Polish
- [x] Add `compare` action to `scripts/build-flavors.sh` producing side-by-side matrix table.
- [x] Add `export-profile` action generating machine-readable JSON hardware specifications.
- [x] Wire "Compare Profiles" button into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Document comparison matrix in `docs/HARDWARE_MATRIX_COMPARISON.md`.
- [x] Update `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate`.
- [x] Bump release version to v4.4.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Add ARM64 cross-compilation target profile to `scripts/build-flavors.sh`.
- [ ] Provide WebRTC-based remote desktop streaming helper script.
- [ ] Create automated headless CI pipeline in `.github/workflows/build.yml`.
