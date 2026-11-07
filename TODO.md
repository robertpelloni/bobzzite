# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v4.8.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-compat.sh` to audit broad hardware compatibility tiers.
- [x] Document hardware compatibility tiers in `docs/HARDWARE_COMPATIBILITY_MATRIX.md`.
- [x] Wire "Hardware Compatibility" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate`.
- [x] Bump release version to v4.8.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Add ARM64 cross-compilation target profile to `scripts/build-flavors.sh`.
- [ ] Implement integrated HTML5 gamepad test client for WebRTC streaming.
- [ ] Create automated headless CI pipeline in `.github/workflows/build.yml`.
