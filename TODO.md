# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v7.1.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-shader-cache.sh` for Vulkan SPIR-V shader pipeline pre-warming.
- [x] Document shader caching in `docs/SHADER_CACHE_MANAGEMENT.md`.
- [x] Wire "🔥 Pre-warm Shader Cache" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and mirror executables to `config/files/usr/local/bin/`.
- [x] Bump release version to v7.1.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated eBPF low-latency packet routing optimizer (`bobzzite-ebpf`).
- [ ] Implement automated Wayland color management & HDR calibration tool (`bobzzite-hdr`).
