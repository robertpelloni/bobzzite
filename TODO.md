# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v6.6.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-metrics.sh` for Prometheus telemetry exposition.
- [x] Document metrics schema in `docs/PROMETHEUS_METRICS.md`.
- [x] Wire "Prometheus Metrics Gateway" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and mirror executables to `config/files/usr/local/bin/`.
- [x] Bump release version to v6.6.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated CI benchmark regression gatekeeper (`bobzzite-bench-gate`).
- [ ] Implement automated OpenXR eye-tracking calibration utility (`bobzzite-eye-track`).
