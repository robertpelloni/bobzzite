# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v4.3.0 Release Verification & Polish
- [x] Add `inspect` action to `scripts/build-flavors.sh` for querying driver stacks and session compositors.
- [x] Wire Flavor Inspector action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Document flavor inspector workflows in `docs/HARDWARE_PROFILES_INTEGRATION.md`.
- [x] Update `scripts/validate_build.py` to check all documentation files and scripts.
- [x] Bump release version to v4.3.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Add ARM64 cross-compilation target profile to `scripts/build-flavors.sh`.
- [ ] Provide WebRTC-based remote desktop streaming helper script.
- [ ] Create automated headless CI pipeline in `.github/workflows/build.yml`.
