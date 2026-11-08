# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v6.5.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-sandbox.sh` for rootless container pod sandboxing.
- [x] Document sandboxing architecture in `docs/ROOTLESS_SANDBOXING.md`.
- [x] Wire "Rootless Sandbox" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Install hardware profile catalog into `config/files/usr/share/bobzzite/hardware_profiles/`.
- [x] Update `scripts/validate_build.py` and mirror executables to `config/files/usr/local/bin/`.
- [x] Bump release version to v6.5.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated telemetry Prometheus exporter gateway (`bobzzite-metrics`).
- [ ] Implement automated CI benchmark regression gatekeeper (`bobzzite-bench-gate`).
