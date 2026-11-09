# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.5.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-shm.sh` for shared memory and zero-copy diagnostics.
- [x] Document zero-copy graphics and audio pipelines in `docs/SHARED_MEMORY_PIPELINE.md`.
- [x] Wire "Shared Memory & Zero-Copy" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register shared memory engine in `scripts/validate_build.py` and mirror to `config/files/usr/local/bin/`.
- [x] Bump release version to v8.5.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated zero-dependency microcode updater wrapper (`bobzzite-microcode-update`).
- [ ] Implement hardware audio quantum latency stress benchmark (`bobzzite-audio-stress`).
