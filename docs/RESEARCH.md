# bobzzite Technical Research

## Linux Distro Comparison

### Immutable vs Traditional

| Type | Examples | Pros | Cons |
|------|----------|------|------|
| **Immutable** | SteamOS, Bazzite, Fedora Silverblue | Can't break system, atomic rollback, consistent state | Less flexible, apps via Flatpak/containers |
| **Traditional** | Ubuntu, Mint, Kubuntu | Flexible, familiar, huge package repos | Can break on updates, dependency hell |

### Gaming Distros

#### SteamOS 3.x (Valve)
- **Base**: Arch Linux
- **Desktop**: KDE Plasma + Gamescope compositor
- **Target**: Steam Deck (but runs on PCs)
- **Features**: Proton, Steam Big Picture, A/B partition updates
- **Limitation**: Designed for Steam Deck hardware, less tested on desktop

#### Bazzite (Universal Blue)
- **Base**: Fedora Atomic (Kinoite/Silverblue)
- **Desktop**: KDE or GNOME options
- **Target**: Any gaming PC/laptop
- **Features**: 
  - Everything SteamOS has
  - Better hardware support (especially NVIDIA)
  - Desktop and Deck editions
  - Decky Loader plugins
  - HandyGCCS for handheld PCs
- **Build**: OCI container images via GitHub Actions
- **Repo**: github.com/ublue-os/bazzite

#### Nobara (GloriousEggroll)
- **Base**: Fedora Workstation (traditional)
- **Desktop**: KDE, GNOME, or official spins
- **Target**: Gaming + content creation
- **Features**: Gaming patches, OBS plugins, codec packs
- **Difference**: Traditional package management, not immutable

### User-Friendly Distros

#### Linux Mint
- **Base**: Ubuntu LTS
- **Desktop**: Cinnamon (default), MATE, Xfce
- **Philosophy**: Conservative, stable, Windows-like
- **Best for**: Windows users who want familiar UX

#### ZorinOS
- **Base**: Ubuntu LTS
- **Desktop**: GNOME with heavy customization
- **Philosophy**: Polish, appearance, "just works"
- **Best for**: Users who care about aesthetics
- **Note**: Has paid "Pro" version with extra layouts

#### Kubuntu
- **Base**: Ubuntu
- **Desktop**: KDE Plasma (vanilla)
- **Philosophy**: Pure KDE experience on Ubuntu base
- **Best for**: KDE enthusiasts, customization lovers

---

## Why Bazzite for bobzzite

1. **Gaming already solved**: Proton, Steam, Lutris, controllers all work
2. **Immutable = safe**: Users can't `sudo rm -rf /`, updates atomic
3. **Modern base**: Fedora 41, not Ubuntu 22.04 LTS
4. **Build system**: Universal Blue makes customization easy
5. **Active development**: Bazzite team is responsive, growing

### Universal Blue Architecture

```
Fedora CoreOS/Atomic
    ↓ (add drivers, codecs)
Universal Blue base images
    ↓ (add gaming stack)
Bazzite
    ↓ (add bob ecosystem)
bobzzite
```

Each layer is a container image. Building bobzzite = writing a Containerfile that starts `FROM bazzite` and adds our stuff.

---

## Building Custom Images

### Universal Blue Template
github.com/ublue-os/image-template

Standard structure:
```
├── Containerfile         # OCI build definition
├── config/
│   ├── recipe.yml        # BlueBuild recipe format
│   ├── files/            # Files to include
│   └── scripts/          # Build scripts
└── .github/workflows/    # CI to build images
```

### Build Process
1. GitHub Actions triggered on push
2. Buildah/Podman builds container image
3. Image pushed to GHCR (GitHub Container Registry)
4. Users `rpm-ostree rebase` to new image

### Key Files

**Containerfile**:
```dockerfile
FROM ghcr.io/ublue-os/bazzite:latest
COPY config/files /
RUN /tmp/scripts/build.sh
```

**recipe.yml** (BlueBuild format):
```yaml
name: bobzzite
base-image: ghcr.io/ublue-os/bazzite
modules:
  - type: rpm-ostree
    install: [git, gh, neofetch]
  - type: default-flatpaks
    system:
      install: [org.godotengine.Godot]
```

---

## Customization Opportunities

### Branding
- `/usr/lib/os-release` - OS identification
- `/usr/share/backgrounds/` - Wallpapers
- `/usr/share/icons/` - Icon themes
- Plymouth theme - Boot splash
- GRUB theme - Bootloader
- SDDM/GDM theme - Login screen

### Pre-installed Apps (Flatpak)
- bobzilla (when packaged as Flatpak)
- bobfilez (when packaged)
- Godot Engine
- VS Codium
- OBS Studio
- GIMP, Audacity

### System Tweaks
- Default Firefox → bobzilla
- Gaming-optimized kernel parameters (already in Bazzite)
- bob-themed MOTD
- Custom neofetch config

### Future: Multiplayer Computing
Ideas to explore:
- **Rustdesk** built-in for remote access
- **Syncthing** for P2P file sync
- **Waypipe** for Wayland forwarding
- **NICE DCV** or similar for low-latency streaming
- Custom P2P session sharing (huge undertaking)

---

## Installation Methods

### Fresh Install
1. Build ISO using `isogenerator` (Universal Blue tool)
2. Flash to USB
3. Boot and install via Anaconda

### Rebase (from any Fedora Atomic)
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
systemctl reboot
```

### Rebase (from Bazzite)
Same command - seamless since we're layered on Bazzite.

---

## Roadmap

### Phase 1: Foundation ✅
- [x] Repo structure created
- [x] Containerfile written
- [x] GitHub Actions workflow
- [x] Basic branding hooks

### Phase 2: Branding
- [ ] bob wallpapers
- [ ] Custom Plymouth splash
- [ ] SDDM/GDM theme
- [ ] Icon pack

### Phase 3: Apps
- [ ] Package bobzilla as Flatpak
- [ ] Package bobfilez as Flatpak
- [ ] Include bob's game
- [ ] Default app selections

### Phase 4: Distribution
- [ ] Build working images
- [ ] Generate ISOs
- [ ] Documentation
- [ ] Community testing

### Phase 5: Unique Features
- [ ] Multiplayer computing experiments
- [ ] bobcoin integration
- [ ] Indie dev toolkit

---

## Resources

- Bazzite: https://bazzite.gg / github.com/ublue-os/bazzite
- Universal Blue: https://universal-blue.org
- BlueBuild: https://blue-build.org
- Fedora Atomic: https://fedoraproject.org/atomic-desktops/
- Image Template: github.com/ublue-os/image-template
