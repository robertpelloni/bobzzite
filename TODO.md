# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v7.3.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-coverage.sh` for hardware matrix coverage verification.
- [x] Document matrix completeness criteria in `docs/HARDWARE_COVERAGE_AUDIT.md`.
- [x] Wire "Hardware Coverage Audit" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and mirror executables to `config/files/usr/local/bin/`.
- [x] Bump release version to v7.3.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated eBPF low-latency packet routing optimizer (`bobzzite-ebpf`).
- [ ] Implement automated Wayland color management & HDR calibration tool (`bobzzite-hdr`).
