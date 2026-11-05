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

## Phase 4: Hardware Profiles & ISO Generation (In Progress)
- [x] Universal Blue ISO generator documentation & workflow (`docs/ISO_BUILD.md`)
- [x] Hardware profiles and handheld compatibility (Steam Deck, ROG Ally, Legion Go)
- [ ] Multi-flavor target matrix: Handheld (Deck/Ally/Legion), Desktop AMD/Intel, and Desktop NVIDIA
- [ ] Publish automated ISO releases to GitHub releases

## Phase 5: Multiplayer & Distributed Cloud OS
- [ ] Built-in P2P mesh networking via Tailscale / Syncthing
- [ ] Low-latency remote game streaming and collaboration tools
- [ ] Decentralized asset syncing for distributed game development
