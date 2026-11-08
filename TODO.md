# Bobzzite OS - Granular Task List (TODO)

## Active Sprint: v5.4.0 Release Verification & Polish
- [x] Create `scripts/bobzzite-sign.sh` for Cosign image signature verification.
- [x] Document image signing architecture in `docs/IMAGE_SIGNING_VERIFICATION.md`.
- [x] Wire "Verify Image Signatures" action into `bobzzite-control-center` GUI with descriptive tooltip.
- [x] Update `scripts/validate_build.py` and `config/files/usr/local/bin/bobzzite-validate`.
- [x] Bump release version to v5.4.0 across `VERSION.md`, `Containerfile`, and `bobzzite-release`.

## Upcoming Enhancements
- [ ] Add real-time GPU frequency graphs to Web Dashboard interface.
- [ ] Integrate automated PR preview branch builds with ephemeral OCI tags.
