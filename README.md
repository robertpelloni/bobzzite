# bobzzite

**Gaming Linux, bob-style.**

A custom Bazzite/Universal Blue image for gaming, indie development, and the bob ecosystem.

*Part of the bob software ecosystem by Robert Pelloni.*

## What is bobzzite?

bobzzite is a custom image built on [Bazzite](https://bazzite.gg), which is built on [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) and [Universal Blue](https://universal-blue.org/).

**Why Bazzite as base?**
- SteamOS-like gaming experience on any hardware
- Proton/Wine pre-configured
- AMD/NVIDIA drivers out of the box
- Atomic updates (can't break your system)
- rpm-ostree for immutable base + Flatpak for apps

**What bobzzite adds:**
- bob ecosystem apps pre-installed (bobzilla, bobfilez)
- bob's game included
- Custom branding and theming
- Indie game dev tools (Godot, optional Unity)
- bobcoin wallet integration (future)

## Features

### Gaming (Inherited from Bazzite)
- Steam + Proton pre-installed
- Lutris, Heroic Launcher for non-Steam games
- MangoHud for performance overlay
- Gamescope compositor
- Xbox/PlayStation controller support
- FSR upscaling

### bob Ecosystem
- [bobzilla](https://github.com/robertpelloni/bobzilla) - Privacy-first Firefox fork
- [bobfilez](https://github.com/robertpelloni/bobfilez) - File organization
- bob's game - The game that started it all
- Custom bob-themed wallpapers and icons

### Indie Dev Focus
- Godot Engine (Flatpak)
- VS Code / Codium
- Git + GitHub CLI
- Wine for Windows-only tools (like ArrowVortex)

### Future Ideas
- **Multiplayer computing** - Shared sessions, P2P collaboration
- **bobcoin integration** - Proof-of-play, wallet built-in
- **Streaming** - OBS pre-configured for game streaming

## How Universal Blue Works

```
Fedora Atomic (base)
    ↓
Universal Blue (adds drivers, codecs, polish)
    ↓
Bazzite (gaming focus, Steam, Proton)
    ↓
bobzzite (bob ecosystem, branding, indie dev tools)
```

Images are built via GitHub Actions and published to a container registry. Users rebase to the new image:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
```

## Building

bobzzite uses the [Universal Blue image template](https://github.com/ublue-os/image-template).

### Prerequisites
- GitHub account
- Container registry access (GHCR)
- GitHub Actions enabled

### Quick Start

1. Fork this repo
2. Enable GitHub Actions
3. Push changes to trigger build
4. Rebase your system to the built image

### Local Build (for testing)

```bash
# Install podman
sudo dnf install podman

# Build the image
podman build -t bobzzite .

# Test in a VM or container
```

## Repository Structure

```
bobzzite/
├── Containerfile          # Main build definition
├── config/
│   ├── files/             # Files to copy into image
│   ├── scripts/           # Build-time scripts
│   └── recipe.yml         # Package list and config
├── branding/
│   ├── wallpapers/        # bob-themed wallpapers
│   ├── icons/             # Custom icons
│   └── plymouth/          # Boot splash
├── packages/
│   └── bob-apps.txt       # List of bob ecosystem apps
├── scripts/
│   └── post-install.sh    # Post-install customization
└── docs/
    └── RESEARCH.md        # Technical documentation
```

## Installation

### Fresh Install
1. Download bobzzite ISO (when available)
2. Flash to USB with Ventoy or Rufus
3. Boot and install

### Rebase from Bazzite
If you're already running Bazzite:
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
systemctl reboot
```

### Rebase from Fedora Atomic
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
systemctl reboot
```

## Philosophy

1. **Gaming first** - Everything should just work for games
2. **Indie dev friendly** - Tools for making games, not just playing
3. **bob ecosystem** - Integrated experience across bob apps
4. **Atomic updates** - Never break your system
5. **Absurdist branding** - It's called bobzzite, embrace it

## Related Projects

- [Bazzite](https://bazzite.gg) - Our upstream base
- [Universal Blue](https://universal-blue.org) - The image building framework
- [bobzilla](https://github.com/robertpelloni/bobzilla) - Firefox fork
- [bobium](https://github.com/robertpelloni/bobium) - Chromium fork
- [bobcoin](https://github.com/robertpelloni/bobcoin) - Proof-of-play crypto
- [bob's game](https://bobsgame.com) - The game

## License

Apache 2.0 (following Universal Blue conventions)

---

*"All games will eventually be played on bobzzite, running in bobzilla, powered by bobcoin."*
