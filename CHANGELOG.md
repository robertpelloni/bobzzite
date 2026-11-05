# bobzzite Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-04-12

### Fixed
- Added system binary `bobzzite-validate` in `/usr/local/bin` and updated `scripts/bobzzite-control-center.py` to locate the validation tool dynamically so the "Validate Repo / Build" action functions seamlessly from any working directory.
- Synchronized image metadata and version strings to 1.0.1.

## [1.0.0] - 2026-04-12

### Added
- Landmark 1.0.0 Stable Release of **bobzzite**.
- Added Distrobox container management tool `scripts/bobzzite-devbox.sh` (and `/usr/local/bin/bobzzite-devbox`) supporting zero-configuration setup of Arch and Ubuntu developer containers.
- Integrated Distrobox container management action into Bobzzite Control Center.
- Added comprehensive live & offline installer ISO generation guide in `docs/ISO_BUILD.md`.
- Updated build validation to verify `docs/ISO_BUILD.md` and `scripts/bobzzite-devbox.sh`.

## [0.9.0] - 2026-04-12

### Added
- Created unified Bobzzite Control Center GUI (`scripts/bobzzite-control-center.py` and `/usr/local/bin/bobzzite-control-center`).
- Added application launcher `config/files/etc/skel/.local/share/applications/bobzzite-control-center.desktop`.
- Consolidated dashboard features into a single cohesive window:
  - High-Value Quick Actions (Indie Tool Suite provisioning, Godot Starter Project launch, Godot-Codium LSP wiring).
  - System Updates & Diagnostics (rpm-ostree query, Flatpak update check, local build validation).
  - Hardware & Gaming profiles (Fastfetch query, GameMode status, safe server shutdown/exit).
  - Explicit interactive buttons, status console with real-time process output, and descriptive tooltip guidance.
- Updated `README.md`, `docs/USER_GUIDE.md`, and build validation script.

## [0.8.0] - 2026-04-12

### Added
- Added custom SDDM login greeter theme in `branding/sddm/bobzzite/` (`Main.qml`, `metadata.desktop`, `theme.conf`, wallpaper, and logo assets).
- Added Fastfetch terminal system branding configuration in `config/files/etc/fastfetch/config.jsonc`.
- Configured `Containerfile` and `config/scripts/build.sh` to install the SDDM theme into `/usr/share/sddm/themes/bobzzite/`.
- Updated build validation to verify SDDM theme source files.

## [0.7.0] - 2026-04-12

### Added
- Added custom Plymouth boot splash theme in `branding/plymouth/bobzzite/`.
- Configured `Containerfile` and `config/scripts/build.sh` to install the Plymouth theme into `/usr/share/plymouth/themes/bobzzite/` and set it as default via `plymouth-set-default-theme`.
- Updated build validation to test Plymouth theme directory.

## [0.6.2] - 2026-04-12

### Documentation
- Updated `README.md` with complete governance documentation suite index, system binary references, and CI automation summary.
- Updated `HANDOFF.md` and `TODO.md` tracking version 0.6.2.

## [0.6.1] - 2026-04-12

### Documentation
- Added visual ASCII architecture hierarchy diagrams to `README.md` and `docs/USER_GUIDE.md`.
- Expanded `docs/USER_GUIDE.md` with in-depth FAQ (Flatpak isolation, Distrobox containers, LSP troubleshooting).
- Added hardware compatibility specifications for desktop GPUs and handheld gaming devices in `README.md`.
- Updated `HANDOFF.md` and `TODO.md`.

## [0.6.0] - 2026-04-12

### Added
- Integrated automated build configuration validation (`scripts/validate_build.py`) into GitHub Actions CI workflow (`.github/workflows/build.yml`).
- Added version label `org.opencontainers.image.version` and `IMAGE_VERSION` ARG to `Containerfile`.

## [0.5.1] - 2026-04-12

### Documentation
- Updated `DEPLOY.md` to document both graphical launcher workflows and direct terminal usage of `/usr/local/bin` helper tools.
- Expanded `docs/USER_GUIDE.md` with a comprehensive troubleshooting section for Flatpak permissions, LSP networking, and configuration re-runs.
- Updated `HANDOFF.md` and `TODO.md` to reflect latest user experience and system binary refinements.

## [0.5.0] - 2026-04-12

### Added
- Added desktop application shortcuts:
  - `bobzzite-dev-tools.desktop`: Graphical launcher to run indie developer provisioning.
  - `bobzzite-godot-starter.desktop`: Quick-launch shortcut to open the starter project in Godot 4.
- Installed helper scripts to `/usr/local/bin` (`install-indie-tools.sh`, `configure-godot-codium.sh`).
- Added comprehensive User Guide (`docs/USER_GUIDE.md`) covering first boot, dev workflows, gaming features, and maintenance.
- Updated `README.md` and build validation tooling.

## [0.4.0] - 2026-04-12

### Added
- Added Godot 4 editor settings template (`config/files/etc/skel/.config/godot/editor_settings-4.tres`) pre-configured to launch VS Codium as the external script editor.
- Added Godot 4 starter game project skeleton (`config/files/etc/skel/Templates/Godot4_Starter/project.godot`).
- Enhanced `scripts/configure-godot-codium.sh` to trigger automated installation of the `geequlim.godot-tools` extension via Flatpak CLI.
- Updated `README.md` and `docs/RESEARCH.md` documenting the bidirectional Godot + VS Codium workflow.

## [0.3.1] - 2026-04-12

### Documentation
- Updated `DEPLOY.md` to document the post-rebase provisioning pipeline (`post-install.sh`, `install-indie-tools.sh`, `configure-godot-codium.sh`).
- Updated `docs/RESEARCH.md` with detailed status of the developer tooling layer, Godot 4 & VS Codium LSP routing, and roadmap progress.
- Updated `HANDOFF.md` and `TODO.md` with latest developer tooling achievements.

## [0.3.0] - 2026-04-12

### Added
- Added `scripts/configure-godot-codium.sh` to configure external editor linking, GDScript LSP settings, and Flatpak network/ipc permissions between Godot 4 and VS Codium.
- Integrated `scripts/configure-godot-codium.sh` into `scripts/post-install.sh`.
- Updated `README.md` and documentation suite to detail Godot + VS Codium workflow.
- Updated `scripts/validate_build.py` to validate `configure-godot-codium.sh`.

## [0.2.0] - 2026-04-12

### Added
- Added `scripts/install-indie-tools.sh` to install the indie game dev suite (Godot, VSCodium, GIMP, Audacity, OBS Studio) via Flatpak.
- Integrated indie tool installer into `scripts/post-install.sh`.
- Updated `README.md` with updated build status and indie dev tool usage.
- Updated `scripts/validate_build.py` to validate indie tool installation scripts.

## [0.1.0] - 2026-04-12

### Added
- Created `config/files/etc/bobzzite-release` containing system identity metadata.
- Added default branding assets in `branding/wallpapers/` and `branding/icons/`.
- Implemented build validation script `scripts/validate_build.py`.
- Created comprehensive governance suite: `VISION.md`, `ROADMAP.md`, `TODO.md`, `MEMORY.md`, `DEPLOY.md`, `IDEAS.md`, `HANDOFF.md`, and `VERSION.md`.

### Fixed
- Fixed missing directory references in `Containerfile` (`config/files`, `branding/wallpapers`, `branding/icons`).
- Hardened `config/scripts/build.sh` and `scripts/post-install.sh` with safe execution checks.
