# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.8.0 Release - Dynamic Multi-GPU & PRIME Render Offload Engine
- [x] Create `scripts/bobzzite-prime.sh` and mirror to `config/files/usr/local/bin/bobzzite-prime`.
- [x] Document multi-GPU architecture, battery conservation, and offload protocols in `docs/PRIME_GPU_OFFLOAD.md`.
- [x] Connect "Multi-GPU & PRIME Offload" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register prime offload engine in `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate`.
- [x] Bump release version to v8.8.0 across `VERSION.md`, `Containerfile`, `bobzzite-release`, and `hardware_profiles/`.

## Upcoming Enhancements
- [ ] Implement Vulkan shader pipeline warm-up gatekeeper (`bobzzite-warmup`).
- [ ] Implement automated battery charge cycle logging and wear rate historical tracking.
