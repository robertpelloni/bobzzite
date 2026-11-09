# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.6.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-audio-stress.sh` for PipeWire audio quantum buffer stress benchmarking.
- [x] Document audio quantum latencies and DSP workloads in `docs/AUDIO_LATENCY_STRESS.md`.
- [x] Wire "Audio Latency Stress Test" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register audio stress engine in `scripts/validate_build.py` and mirror to `config/files/usr/local/bin/`.
- [x] Bump release version to v8.6.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated zero-dependency microcode updater wrapper (`bobzzite-microcode-update`).
- [ ] Implement Vulkan shader pipeline warm-up gatekeeper (`bobzzite-warmup`).
