# bobzzite System Memory & Architectural Notes

## Architectural Traits
- **Base Layer**: Built on top of `ghcr.io/ublue-os/bazzite:latest`, which in turn layers on Fedora Atomic Desktops (Silverblue/Kinoite).
- **OCI Image Delivery**: Operating system is built, tagged, and delivered as standard container images via OCI registries (GHCR).
- **Immutable Deployment**: Updates are handled atomically via `rpm-ostree rebase` or `rpm-ostree update`. User applications run in Flatpak or container environments (Distrobox / Toolbx).
- **Branding Architecture**:
  - Branding assets live in `branding/` (`wallpapers/`, `icons/`).
  - System configuration files live in `config/files/` and are mapped to root `/`.
  - Build scripts live in `config/scripts/build.sh`.
  - Post-install setup lives in `scripts/post-install.sh`.
- **Hardware Profile Differential Analysis & Automated Migration**:
  - `bobzzite-diff` (`scripts/bobzzite-diff.sh`) inspects and compares target JSON profiles from `hardware_profiles/` and outputs terminal tables, Markdown tables, or JSON diffs.
  - `bobzzite-migrate` (`scripts/bobzzite-migrate.sh`) coordinates pre-flight hardware checks, differential analysis, snapshots, and atomic rebase execution across profiles.
- **Validation**:
  - Build validation tool is located at `scripts/validate_build.py`.
