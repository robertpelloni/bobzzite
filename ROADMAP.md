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
