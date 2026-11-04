# bobzzite Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-04-12

### Added
- Created `config/files/etc/bobzzite-release` containing system identity metadata.
- Added default branding assets in `branding/wallpapers/` and `branding/icons/`.
- Implemented build validation script `scripts/validate_build.py`.
- Created comprehensive governance suite: `VISION.md`, `ROADMAP.md`, `TODO.md`, `MEMORY.md`, `DEPLOY.md`, `IDEAS.md`, `HANDOFF.md`, and `VERSION.md`.

### Fixed
- Fixed missing directory references in `Containerfile` (`config/files`, `branding/wallpapers`, `branding/icons`).
- Hardened `config/scripts/build.sh` and `scripts/post-install.sh` with safe execution checks.
