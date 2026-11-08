# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v7.0.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-lockdown.sh` for kernel lockdown & Secure Boot validation.
- [x] Document kernel security primitives in `docs/KERNEL_LOCKDOWN.md`.
- [x] Wire "Kernel Lockdown & Security" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and mirror executables to `config/files/usr/local/bin/`.
- [x] Bump release version to v7.0.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Implement automated Godot 4 shader pre-compilation cache manager (`bobzzite-shader-cache`).
- [ ] Implement automated eBPF low-latency packet routing optimizer (`bobzzite-ebpf`).
