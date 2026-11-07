# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v4.9.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-ci.sh` to execute the complete local CI smoke pipeline.
- [x] Enhance `.github/workflows/build.yml` with automated matrix testing and container builds.
- [x] Document CI workflows in `docs/CONTINUOUS_INTEGRATION.md`.
- [x] Wire "Run CI Smoke Suite" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate`.
- [x] Bump release version to v4.9.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Add ARM64 cross-compilation target profile to `scripts/build-flavors.sh`.
- [ ] Implement integrated HTML5 gamepad test client for WebRTC streaming.
- [ ] Setup automated release signing and container image provenance verification.
