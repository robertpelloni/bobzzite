# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.4.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-gyro.sh` for handheld gyro and motion sensor calibration.
- [x] Document IIO bus architecture and zero-drift calibration in `docs/HANDHELD_GYRO_CALIBRATION.md`.
- [x] Wire "Handheld Gyro & Motion" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register gyro calibrator in `scripts/validate_build.py` and mirror to `config/files/usr/local/bin/`.
- [x] Bump release version to v8.4.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated zero-dependency microcode updater wrapper (`bobzzite-microcode-update`).
- [ ] Implement memory-mapped shared buffer playtesting diagnostics (`bobzzite-shm`).
