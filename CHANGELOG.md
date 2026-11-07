# bobzzite Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.5.0] - 2026-04-12

### Added
- Added multi-flavor build environment configuration generator (`scripts/build-flavors.sh <flavor> config`).
- Exported flavor target metadata, default compositors (gamescope vs kwin_wayland), and driver stacks to `.flavor-config.env`.
- Authored comprehensive hardware flavor customization guide in `docs/HARDWARE_CUSTOMIZATION.md`.
- Updated build validation to verify `docs/HARDWARE_CUSTOMIZATION.md`.
- Bumped version to 3.5.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [3.4.0] - 2026-04-12

### Added
- Added automated game test runner and CI tool `bobzzite-test` (`scripts/bobzzite-test.sh` and `/usr/local/bin/bobzzite-test`).
- Added headless GDScript syntax checking, Godot project configuration validation, and scene hierarchy verification.
- Integrated "Run Game Tests" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive game test runner and CI/CD guide in `docs/AUTOMATED_TESTING.md`.
- Updated build validation to verify `scripts/bobzzite-test.sh` and `docs/AUTOMATED_TESTING.md`.
- Bumped version to 3.4.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [3.3.0] - 2026-04-12

### Added
- Added automated game localization and string management utility `bobzzite-i18n` (`scripts/bobzzite-i18n.sh` and `/usr/local/bin/bobzzite-i18n`).
- Implemented multi-language translation CSV templating, catalog scanning, and gettext `.mo` compilation for Godot 4.
- Integrated "Localization & i18n" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive game internationalization guide in `docs/LOCALIZATION.md`.
- Updated build validation to verify `scripts/bobzzite-i18n.sh` and `docs/LOCALIZATION.md`.
- Bumped version to 3.3.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [3.2.0] - 2026-04-12

### Added
- Added automated game asset optimization pipeline `bobzzite-assets` (`scripts/bobzzite-assets.sh` and `/usr/local/bin/bobzzite-assets`).
- Implemented texture scanning, PNG lossless compression, and audio stream transcoding to OGG Vorbis.
- Integrated "Optimize Game Assets" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive game asset conditioning guide in `docs/ASSET_PIPELINE.md`.
- Updated build validation to verify `scripts/bobzzite-assets.sh` and `docs/ASSET_PIPELINE.md`.
- Bumped version to 3.2.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [3.1.0] - 2026-04-12

### Added
- Added multi-flavor architecture profiling and benchmark action (`scripts/build-flavors.sh all bench-matrix`).
- Authored hardware matrix tier specifications and handheld performance profiles in `docs/HARDWARE_MATRIX_PROFILES.md`.
- Integrated "Hardware Flavors" matrix benchmarking action into the unified Bobzzite Control Center dashboard UI.
- Updated build validation to verify `docs/HARDWARE_MATRIX_PROFILES.md`.
- Bumped version to 3.1.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [3.0.0] - 2026-04-12

### Added
- Added multi-flavor build matrix automated verification test suite (`scripts/build-flavors.sh all test-matrix`).
- Verified build arguments, upstream base image registry accessibility, and label metadata consistency across `bobzzite`, `bobzzite-deck`, and `bobzzite-nvidia`.
- Integrated "Hardware Flavors" matrix verification action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive hardware matrix testing guide in `docs/HARDWARE_MATRIX_TESTING.md`.
- Updated build validation to verify `docs/HARDWARE_MATRIX_TESTING.md`.
- Bumped major version milestone to 3.0.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.9.0] - 2026-04-12

### Added
- Added automated hardware flavor detection (`detect` / `auto-detect`) in `scripts/bobzzite-deploy.sh` (and `/usr/local/bin/bobzzite-deploy`) via DMI chassis and PCI vendor probing.
- Wired hardware auto-detection into Bobzzite Control Center "Deploy & Rebase" dashboard action.
- Authored comprehensive hardware compatibility and automated flavor selection guide in `docs/HARDWARE_DETECTION.md`.
- Updated build validation to verify `docs/HARDWARE_DETECTION.md`.
- Bumped version to 2.9.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.7.0] - 2026-04-12

### Added
- Added automated indie game packaging and release bundler `bobzzite-package` (`scripts/bobzzite-package.sh` and `/usr/local/bin/bobzzite-package`).
- Integrated "Package Game Project" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive game packaging and Steam Deck verification guide in `docs/GAME_PACKAGING.md`.
- Updated build validation to verify `scripts/bobzzite-package.sh` and `docs/GAME_PACKAGING.md`.
- Bumped version to 2.7.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.6.0] - 2026-04-12

### Added
- Authored Build Health and Quality Assurance specification in `docs/BUILD_HEALTH.md`.
- Expanded `README.md` documentation index with links and descriptions across all 14 technical guides.
- Updated `scripts/validate_build.py` to enforce presence and formatting of `docs/BUILD_HEALTH.md`.
- Bumped version to 2.6.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.5.0] - 2026-04-12

### Added
- Added remote game and developer streaming management utility `bobzzite-stream` (`scripts/bobzzite-stream.sh` and `/usr/local/bin/bobzzite-stream`).
- Added status monitoring, service control, web UI launcher, and hardware video encoder probing for Sunshine and Moonlight.
- Integrated "Game Streaming" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive game and development streaming guide in `docs/STREAMING.md`.
- Updated build validation to verify `scripts/bobzzite-stream.sh` and `docs/STREAMING.md`.
- Bumped version to 2.5.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.4.0] - 2026-04-12

### Added
- Added local deployment and rebase automation tool `bobzzite-deploy` (`scripts/bobzzite-deploy.sh` and `/usr/local/bin/bobzzite-deploy`).
- Added OCI archive export action (`export-tar`) to `scripts/build-flavors.sh` for offline and air-gapped machine setups.
- Integrated "Deploy & Rebase" action into the unified Bobzzite Control Center dashboard UI.
- Rewrote `DEPLOY.md` with multi-flavor rebase instructions, registry commands, and air-gapped workflows.
- Updated build validation to verify `scripts/bobzzite-deploy.sh`.
- Bumped version to 2.4.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.3.0] - 2026-04-12

### Added
- Enhanced multi-hardware flavor build automation engine `scripts/build-flavors.sh` with manifest inspection, dry-run checking, and target verification.
- Integrated "Hardware Flavors" action into the unified Bobzzite Control Center dashboard UI.
- Updated `docs/HARDWARE_FLAVORS.md` with multi-target matrix architecture and CLI invocation workflows.
- Bumped version to 2.3.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.2.0] - 2026-04-12

### Added
- Added automated audio server diagnostic and profile switcher `bobzzite-audio` (`scripts/bobzzite-audio.sh` and `/usr/local/bin/bobzzite-audio`).
- Implemented status probe for PipeWire, WirePlumber, ALSA cards, and latency quantum inspection.
- Added Low-Latency Pro-Audio profile (128 buffer quantum / ~2.6ms latency) and stereo speaker test routines.
- Integrated "Audio & PipeWire" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive audio architecture guide in `docs/AUDIO_SETUP.md`.
- Updated build validation to verify `scripts/bobzzite-audio.sh` and `docs/AUDIO_SETUP.md`.
- Bumped version to 2.2.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.1.0] - 2026-04-12

### Added
- Added automated hardware benchmarking and performance profiler `bobzzite-bench` (`scripts/bobzzite-bench.sh` and `/usr/local/bin/bobzzite-bench`).
- Benchmarking includes CPU single-thread hashing throughput, disk sequential I/O write latency, CPU scaling governor detection, and Vulkan GPU probe.
- Integrated "Run Benchmark" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive benchmarking and hardware baseline documentation in `docs/BENCHMARKS.md`.
- Updated build validation to verify `scripts/bobzzite-bench.sh` and `docs/BENCHMARKS.md`.
- Bumped version to 2.1.0 across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [2.0.0] - 2026-04-12

### Added
- Added automated system storage maintenance & cache purging tool `bobzzite-clean` (`scripts/bobzzite-clean.sh` and `/usr/local/bin/bobzzite-clean`).
- Cleaned unused Flatpak runtimes, Flatpak app caches, user thumbnail directories, crash dumps, and vacuumed systemd journal logs.
- Integrated "Purge System Caches" action into the unified Bobzzite Control Center dashboard UI.
- Authored comprehensive storage and maintenance guide in `docs/MAINTENANCE.md`.
- Updated build validation to verify `scripts/bobzzite-clean.sh` and `docs/MAINTENANCE.md`.
- Bumped major version milestone across `VERSION.md`, `Containerfile`, and `config/files/etc/bobzzite-release`.

## [1.9.0] - 2026-04-12

### Added
- Added System Tray Monitor applet `scripts/bobzzite-tray.py` (and `/usr/local/bin/bobzzite-tray`).
- Added autostart launcher `config/files/etc/skel/.config/autostart/bobzzite-tray.desktop` for background system monitoring.
- Enabled quick actions in the tray applet to launch Control Center, trigger diagnostics, and quit background services.
- Updated build validation to verify `scripts/bobzzite-tray.py`.

## [1.8.0] - 2026-04-12

### Added
- Added Game Controller & Handheld Mapping Tool `scripts/bobzzite-gamepad.sh` (and `/usr/local/bin/bobzzite-gamepad`).
- Integrated "Game Controllers" action into Bobzzite Control Center.
- Added comprehensive controller guide and handheld PC mapping notes in `docs/CONTROLLER_SUPPORT.md`.
- Updated build validation to test `docs/CONTROLLER_SUPPORT.md` and `scripts/bobzzite-gamepad.sh`.

## [1.7.0] - 2026-04-12

### Added
- Added System Performance & Latency Tuner `scripts/bobzzite-tweak.sh` (and `/usr/local/bin/bobzzite-tweak`) to manage low-latency sysctl tunables, split-lock mitigation, and PipeWire audio buffers.
- Integrated "System Tuning" action into Bobzzite Control Center.
- Added comprehensive performance tuning guide in `docs/PERFORMANCE_TUNING.md`.
- Updated build validation to test `docs/PERFORMANCE_TUNING.md` and `scripts/bobzzite-tweak.sh`.

## [1.6.1] - 2026-04-12

### Documentation
- Updated `README.md` with full technical specification index across all 7 documentation guides (`ISO_BUILD.md`, `HARDWARE_FLAVORS.md`, `DIAGNOSTICS.md`, `BACKUP_ROLLBACK.md`, `MULTIPLAYER.md`, `FLATPAK_PACKAGING.md`, `USER_GUIDE.md`).
- Documented full system tool suite in `README.md` (`bobzzite-doctor`, `bobzzite-backup`, `bobzzite-devbox`, `bobzzite-mesh`, `build-flavors.sh`, `build-flatpaks.sh`).
- Updated `HANDOFF.md` and `TODO.md` tracking version 1.6.1.

## [1.6.0] - 2026-04-12

### Added
- Added Flatpak packaging manifests for bob ecosystem applications: `packages/flatpak/com.robertpelloni.bobzilla.yml` and `packages/flatpak/com.robertpelloni.bobfilez.yml`.
- Added automated local Flatpak builder script `scripts/build-flatpaks.sh`.
- Added Flatpak packaging and distribution guide in `docs/FLATPAK_PACKAGING.md`.
- Updated build validation to test `docs/FLATPAK_PACKAGING.md` and `scripts/build-flatpaks.sh`.

## [1.5.0] - 2026-04-12

### Added
- Added System Backup, Rollback & Snapshot Utility `scripts/bobzzite-backup.sh` (and `/usr/local/bin/bobzzite-backup`).
- Integrated "Backup / Snapshots" action into Bobzzite Control Center.
- Added comprehensive guide on OSTree pinning, rollback, and user data snapshots in `docs/BACKUP_ROLLBACK.md`.
- Updated build validation to test `docs/BACKUP_ROLLBACK.md` and `scripts/bobzzite-backup.sh`.

## [1.4.0] - 2026-04-12

### Added
- Added Multi-Hardware Flavor Build script `scripts/build-flavors.sh` supporting `bobzzite` (desktop AMD/Intel), `bobzzite-deck` (handheld PCs), and `bobzzite-nvidia` (GeForce GPUs).
- Configured GitHub Actions CI build matrix in `.github/workflows/build.yml` to automatically compile and release all three target hardware flavors.
- Added comprehensive hardware specifications and rebasing guide in `docs/HARDWARE_FLAVORS.md`.
- Updated build validation to test `docs/HARDWARE_FLAVORS.md` and `scripts/build-flavors.sh`.

## [1.3.0] - 2026-04-12

### Added
- Added System Health & Diagnostics Doctor `scripts/bobzzite-doctor.sh` (and `/usr/local/bin/bobzzite-doctor`).
- Integrated "System Doctor" action into Bobzzite Control Center.
- Added comprehensive diagnostics documentation in `docs/DIAGNOSTICS.md`.
- Updated build validation to test `docs/DIAGNOSTICS.md` and `scripts/bobzzite-doctor.sh`.

## [1.2.0] - 2026-04-12

### Added
- Added Multiplayer Mesh & P2P Sync Manager `scripts/bobzzite-mesh.sh` (and `/usr/local/bin/bobzzite-mesh`).
- Integrated Mesh and P2P Sync status action into Bobzzite Control Center GUI.
- Added comprehensive Multiplayer Computing & Remote Game Jam guide in `docs/MULTIPLAYER.md`.
- Updated build validation to verify `docs/MULTIPLAYER.md` and `scripts/bobzzite-mesh.sh`.

## [1.1.0] - 2026-04-12

### Added
- Added First-Boot Onboarding Wizard `scripts/bobzzite-onboarding.sh` and `/usr/local/bin/bobzzite-onboarding`.
- Added autostart entry `config/files/etc/skel/.config/autostart/bobzzite-onboarding.desktop` to guide new users on initial login.
- Added default sound theme in `branding/sounds/bobzzite/` (`index.theme` and desktop login chime).
- Configured `Containerfile` and `config/scripts/build.sh` to install sound assets into `/usr/share/sounds/bobzzite/`.

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
