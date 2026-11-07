# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v4.6.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-profile-validate.sh` to audit hardware profile assertions.
- [x] Document hardware profile validation in `docs/HARDWARE_PROFILE_VALIDATION.md`.
- [x] Wire "Validate Profiles" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate`.
- [x] Bump release version to v4.6.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Add ARM64 cross-compilation target profile to `scripts/build-flavors.sh`.
- [ ] Implement integrated HTML5 gamepad test client for WebRTC streaming.
- [ ] Create automated headless CI pipeline in `.github/workflows/build.yml`.
