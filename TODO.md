# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.3.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-hdr-cal.sh` for Gamescope HDR calibration profile generation.
- [x] Document Gamescope HDR calibration and tone-mapping standards in `docs/GAMESCOPE_HDR_CALIBRATION.md`.
- [x] Wire "Gamescope HDR Calibration" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register HDR calibration generator in `scripts/validate_build.py` and mirror to `config/files/usr/local/bin/`.
- [x] Bump release version to v8.3.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated zero-dependency microcode updater wrapper (`bobzzite-microcode-update`).
- [ ] Implement handheld gyro and motion sensor calibrator (`bobzzite-gyro`).
