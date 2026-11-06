# bobzzite Roadmap

## Phase 1: Core Foundation & Reproducible Image Builds ✅
- [x] Complete missing build assets (`branding/wallpapers`, `branding/icons`, `config/files/etc/`)
- [x] Standardize governance and architecture documentation
- [x] Implement automated repository build validator script
- [x] Establish automated GitHub Actions CI smoke validation check

## Phase 2: System Identity & Branding Polish ✅
- [x] Plymouth boot splash animations matching bob brand identity (`branding/plymouth/bobzzite/`)
- [x] SDDM login greeter theme (`branding/sddm/bobzzite/`)
- [x] Fastfetch system branding configuration (`config/files/etc/fastfetch/`)
- [x] Default SVG wallpaper and logo branding
- [x] Ambient system sound theme (`branding/sounds/bobzzite/`)

## Phase 3: Flatpak Packaging & App Ecosystem ✅
- [x] Automated installer for indie development tools (Godot 4, VS Codium, GIMP, Audacity, OBS Studio)
- [x] Bidirectional Godot 4 + VS Codium LSP routing and starter templates
- [x] Unified Bobzzite Control Center GUI (`bobzzite-control-center`)
- [x] System Tray Monitor applet (`bobzzite-tray`)
- [x] Distrobox environment management tooling (`bobzzite-devbox`)
- [x] First-boot onboarding wizard (`bobzzite-onboarding`)
- [x] Flatpak packaging manifests for bobzilla and bobfilez (`packages/flatpak/`)
- [x] Automated Flatpak builder tooling (`scripts/build-flatpaks.sh`, `docs/FLATPAK_PACKAGING.md`)

## Phase 4: Hardware Profiles & ISO Generation ✅
- [x] Universal Blue ISO generator documentation & workflow (`docs/ISO_BUILD.md`)
- [x] Hardware profiles and handheld compatibility (Steam Deck, ROG Ally, Legion Go)
- [x] Multi-flavor target matrix: Handheld (Deck/Ally/Legion), Desktop AMD/Intel, and Desktop NVIDIA (`scripts/build-flavors.sh`, `docs/HARDWARE_FLAVORS.md`)
- [x] Automated CI matrix build strategy in `.github/workflows/build.yml`
- [x] Atomic rollback, deployment pinning, and dev snapshot management (`docs/BACKUP_ROLLBACK.md`)
- [x] System performance & latency tuning presets (`scripts/bobzzite-tweak.sh`, `docs/PERFORMANCE_TUNING.md`)
- [x] Game controller & handheld input mapping management (`scripts/bobzzite-gamepad.sh`, `docs/CONTROLLER_SUPPORT.md`)

## Phase 5: Multiplayer & Distributed Cloud OS ✅
- [x] Built-in P2P mesh networking via Tailscale (`bobzzite-mesh`)
- [x] Decentralized asset syncing for game projects via Syncthing
- [x] Low-latency remote Wayland game streaming workflows via Waypipe (`docs/MULTIPLAYER.md`)

## Phase 6: System Maintenance & Long-Term Autonomous Governance ✅
- [x] Automated system cleanup, cache pruning, and Flatpak runtime maintenance (`bobzzite-clean`, `docs/MAINTENANCE.md`)
- [x] Integrated cache purge action in unified Bobzzite Control Center
- [x] Automated system hardware benchmark & performance profiler (`bobzzite-bench`, `docs/BENCHMARKS.md`)
- [x] Unified Control Center benchmark runner integration
- [x] Release 2.1.0 milestone reached
- [x] Automated audio server diagnostic and latency switcher (`bobzzite-audio`, `docs/AUDIO_SETUP.md`)
- [x] Integrated Audio & PipeWire manager into unified Bobzzite Control Center
- [x] Release 2.2.0 milestone reached
- [x] Multi-hardware flavor build automation engine enhancement (`scripts/build-flavors.sh`)
- [x] Hardware Flavors inspector wired into Bobzzite Control Center
- [x] Release 2.3.0 milestone reached
- [x] Local deployment & atomic rebase automation tool (`bobzzite-deploy`, `DEPLOY.md`)
- [x] Offline OCI archive export capability in build engine
- [x] Release 2.4.0 milestone reached
- [x] Remote game & dev streaming management utility (`bobzzite-stream`, `docs/STREAMING.md`)
- [x] Integrated Game Streaming launcher into Bobzzite Control Center
- [x] Release 2.5.0 milestone reached
- [x] Build health diagnostics and full documentation index (`docs/BUILD_HEALTH.md`, `README.md`)
- [x] Release 2.6.0 milestone reached
- [x] Automated game packaging and release bundler (`bobzzite-package`, `docs/GAME_PACKAGING.md`)
- [x] Control Center game packager integration
- [x] Release 2.7.0 milestone reached
- [x] VR / XR headset and OpenXR diagnostic utility (`bobzzite-vr`, `docs/VR_SETUP.md`)
- [x] Release 2.8.0 milestone reached
- [x] Automated hardware flavor detection & DMI/PCI probing (`bobzzite-deploy detect`, `docs/HARDWARE_DETECTION.md`)
- [x] Release 2.9.0 milestone reached
- [x] Multi-flavor build matrix automated verification test suite (`scripts/build-flavors.sh all test-matrix`, `docs/HARDWARE_MATRIX_TESTING.md`)
- [x] Major release 3.0.0 milestone reached
