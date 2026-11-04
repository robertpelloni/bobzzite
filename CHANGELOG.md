# bobzzite Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
