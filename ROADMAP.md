# bobzzite Roadmap

## Phase 1: Core Foundation & Reproducible Image Builds ✅
- [x] Complete missing build assets (`branding/wallpapers`, `branding/icons`, `config/files/etc/`)
- [x] Standardize governance and architecture documentation
- [x] Implement automated repository build validator script
- [x] Establish automated GitHub Actions CI smoke validation check

## Phase 2: System Identity & Branding Polish (Near Completion)
- [x] Plymouth boot splash animations matching bob brand identity (`branding/plymouth/bobzzite/`)
- [x] SDDM login greeter theme (`branding/sddm/bobzzite/`)
- [x] Fastfetch system branding configuration (`config/files/etc/fastfetch/`)
- [x] Default SVG wallpaper and logo branding
- [ ] Default desktop sound themes and cursor schemes

## Phase 3: Flatpak Packaging & App Ecosystem (Partially Complete)
- [x] Automated installer for indie development tools (Godot 4, VS Codium, GIMP, Audacity, OBS Studio)
- [x] Bidirectional Godot 4 + VS Codium LSP routing and starter templates
- [ ] Package `bobzilla` and `bobfilez` as Flatpaks hosted in dedicated bob flatpak repo
- [ ] Create zero-prompt initial onboarding wizard for new installations

## Phase 4: Hardware Profiles & ISO Generation
- [ ] Multi-flavor target matrix: Handheld (Deck/Ally/Legion), Desktop AMD/Intel, and Desktop NVIDIA
- [ ] Generate bootable live/installer ISOs via Universal Blue `isogenerator`
- [ ] Set up automated release tagging and changelog publishing

## Phase 5: Multiplayer & Distributed Cloud OS
- [ ] Built-in P2P mesh networking via Tailscale / Syncthing
- [ ] Low-latency remote game streaming and collaboration tools
- [ ] Decentralized asset syncing for distributed game development
