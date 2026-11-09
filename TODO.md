# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v8.0.0 Milestone Release Verification & Polish
- [x] Create `scripts/bobzzite-microcode.sh` for CPU microcode and hardware mitigation auditing.
- [x] Document microcode architecture and vulnerabilities in `docs/CPU_MICROCODE_MANAGEMENT.md`.
- [x] Wire "CPU Microcode & Mitigations" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Register microcode tool in `scripts/validate_build.py` and mirror to `config/files/usr/local/bin/`.
- [x] Bump release version to v8.0.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated Vulkan ray tracing pipeline capability auditor (`bobzzite-raytracing`).
- [ ] Implement adaptive thermal fan curve manager for gaming handhelds (`bobzzite-fan`).
