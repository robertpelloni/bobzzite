# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.2.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-fan.sh` for adaptive thermal fan curve management.
- [x] Document thermal sensor architecture and acoustic profiles in `docs/THERMAL_MANAGEMENT.md`.
- [x] Wire "Fan Curves & Thermals" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register fan curve auditor in `scripts/validate_build.py` and mirror to `config/files/usr/local/bin/`.
- [x] Bump release version to v8.2.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement Gamescope HDR calibration profile generator (`bobzzite-hdr-cal`).
- [ ] Implement automated zero-dependency microcode updater wrapper (`bobzzite-microcode-update`).
