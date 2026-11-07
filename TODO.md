# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v4.7.0 Release Verification & Polish
- [x] Add `profile-analyze` action to `scripts/bobzzite-deploy.sh` for hardware fit scoring.
- [x] Document hardware profile analysis in `docs/HARDWARE_PROFILE_ANALYSIS.md`.
- [x] Wire "Profile Analysis" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate`.
- [x] Bump release version to v4.7.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Add ARM64 cross-compilation target profile to `scripts/build-flavors.sh`.
- [ ] Implement integrated HTML5 gamepad test client for WebRTC streaming.
- [ ] Create automated headless CI pipeline in `.github/workflows/build.yml`.
