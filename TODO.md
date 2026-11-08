# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v6.4.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-ipfs.sh` for decentralized package mirror distribution.
- [x] Document decentralized mirroring in `docs/DECENTRALIZED_MIRRORS.md`.
- [x] Wire "P2P / IPFS Package Mirror" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and mirror executables to `config/files/usr/local/bin/`.
- [x] Bump release version to v6.4.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated rootless container pod sandboxing for web services (`bobzzite-sandbox`).
- [ ] Implement automated telemetry Prometheus exporter gateway (`bobzzite-metrics`).
