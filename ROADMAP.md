# bobzzite Roadmap

## Phase 1: Core Foundation & Reproducible Image Builds (Current)
- [x] Complete missing build assets (`branding/wallpapers`, `branding/icons`, `config/files/etc/`)
- [x] Standardize governance and architecture documentation
- [x] Implement automated repository build validator script
- [ ] Establish automated GitHub Actions CI image generation and verification on GHCR

## Phase 2: System Identity & Branding Polish
- [ ] Plymouth boot splash animations matching bob brand identity
- [ ] SDDM/GDM login theme custom skins
- [ ] Fastfetch/Neofetch ASCII art and system branding metadata
- [ ] Default desktop sound themes and cursor schemes

## Phase 3: Flatpak Packaging & App Ecosystem
- [ ] Package `bobzilla` and `bobfilez` as Flatpaks hosted in dedicated bob flatpak repo
- [ ] Curate developer tool suite (Godot 4, VS Codium, Blender, Audacity, OBS Studio)
- [ ] Create zero-prompt initial onboarding wizard for new installations

## Phase 4: Hardware Profiles & ISO Generation
- [ ] Multi-flavor target matrix: Handheld (Deck/Ally/Legion), Desktop AMD/Intel, and Desktop NVIDIA
- [ ] Generate bootable live/installer ISOs via Universal Blue `isogenerator`
- [ ] Set up automated release tagging and changelog publishing

## Phase 5: Multiplayer & Distributed Cloud OS
- [ ] Built-in P2P mesh networking via Tailscale / Syncthing
- [ ] Low-latency remote game streaming and collaboration tools
- [ ] Decentralized asset syncing for distributed game development
