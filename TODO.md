# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.1.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-raytracing.sh` for Vulkan ray tracing pipeline capability auditing.
- [x] Document Vulkan ray tracing architectures and driver stacks in `docs/VULKAN_RAYTRACING.md`.
- [x] Wire "Vulkan Ray Tracing" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register ray tracing auditor in `scripts/validate_build.py` and mirror to `config/files/usr/local/bin/`.
- [x] Bump release version to v8.1.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement adaptive thermal fan curve manager for gaming handhelds (`bobzzite-fan`).
- [ ] Implement Gamescope HDR calibration profile generator (`bobzzite-hdr-cal`).
