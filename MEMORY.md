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
- **Decentralized Package Mirroring**:
  - `bobzzite-ipfs` (`scripts/bobzzite-ipfs.sh`) manages P2P container layer distribution, offline fallback, and content-addressed verification via IPFS/Kubo.
- **Rootless Pod Sandboxing**:
  - `bobzzite-sandbox` (`scripts/bobzzite-sandbox.sh`) manages isolated unprivileged Podman sandboxes with memory limits and seccomp filters for untrusted builds.
- **Prometheus Hardware Telemetry & Comparison Data Extraction**:
  - `bobzzite-metrics` (`scripts/bobzzite-metrics.sh`) exports real-time system performance, thermals, and flavor tags in standard Prometheus exposition format.
  - Side-by-side hardware profile comparison data is documented in `docs/HARDWARE_PROFILE_COMPARISON_DATA.md`.
- **CI Benchmark Regression Gatekeeper**:
  - `bobzzite-bench-gate` (`scripts/bobzzite-bench-gate.sh`) enforces compute SLA baselines and blocks builds on performance degradation.
- **OpenXR Eye Tracking & Dynamic Foveated Rendering**:
  - `bobzzite-eye-track` (`scripts/bobzzite-eye-track.sh`) manages XR_EXT_eye_gaze_interaction, VRS Tier 2 foveation, and 5-point calibration.
- **Validation**:
  - Build validation tool is located at `scripts/validate_build.py`.
