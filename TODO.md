# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v6.9.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-eye-track.sh` for XR eye-tracking calibration & foveation.
- [x] Document eye-gaze standards and VRS in `docs/VR_EYE_TRACKING.md`.
- [x] Wire "XR Eye Tracking" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and mirror executables to `config/files/usr/local/bin/`.
- [x] Bump release version to v6.9.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated zero-trust kernel module lockdown validator (`bobzzite-lockdown`).
- [ ] Implement automated Godot 4 shader pre-compilation cache manager (`bobzzite-shader-cache`).
