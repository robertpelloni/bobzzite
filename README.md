# bobzzite

bobzzite is a custom gaming and indie developer Linux image: a
Universal Blue / Bazzite derivative with bob-ecosystem branding and apps.
Built on Fedora Atomic with rpm-ostree.

```
┌────────────────────────────────────────────────────────┐
│                      bobzzite                          │
│   (Wallpapers, Icons, Godot 4 + VS Codium Workflow,    │
│    Indie Game Dev Suite, Bob Ecosystem Applications)   │
└──────────────────────────┬─────────────────────────────┘
                           │ layers on
┌──────────────────────────▼─────────────────────────────┐
│                      Bazzite                           │
│   (Proton GE, Steam Big Picture, Lutris, Heroic,       │
│    Gamescope, Decky Loader, GameMode, Handheld tweaks) │
└──────────────────────────┬─────────────────────────────┘
                           │ layers on
┌──────────────────────────▼─────────────────────────────┐
│                   Universal Blue                       │
│    (NVIDIA / AMD drivers, multimedia codecs, kernel)   │
└──────────────────────────┬─────────────────────────────┘
                           │ layers on
┌──────────────────────────▼─────────────────────────────┐
│                 Fedora Atomic Desktop                  │
│       (Silverblue / Kinoite immutable rpm-ostree)      │
└────────────────────────────────────────────────────────┘
```

## Features

- **Base Gaming Stack**: Inherits Valve Proton enhancements, Steam Big Picture, Heroic Games Launcher, and GameMode from Bazzite.
- **Indie Development Suite**: Pre-configured automated installation of Godot Engine 4, VS Codium, GIMP, Audacity, and OBS Studio via Flatpak.
- **Bidirectional Godot + VS Codium Workflow**:
  - VS Codium is configured with Godot Tools LSP settings (`127.0.0.1:6005`).
  - Automated extension installation for `geequlim.godot-tools`.
  - Godot 4 editor template (`editor_settings-4.tres`) automatically delegates external script editing to VS Codium with project and cursor line/column arguments.
  - Pre-seeded Godot 4 project starter template in `/etc/skel/Templates/Godot4_Starter`.
- **Bobzzite Control Center GUI**:
  - Unified desktop dashboard (`bobzzite-control-center`) integrating high-value actions, system diagnostics, dev containers, and hardware status into a single window.
  - Real-time execution log console, interactive controls, and explanatory tooltips.
- **Multi-Hardware Flavors**:
  - `bobzzite`: Desktop AMD Radeon and Intel Arc.
  - `bobzzite-deck`: Valve Steam Deck (LCD/OLED), ROG Ally, Legion Go.
  - `bobzzite-nvidia`: Desktop/Laptop NVIDIA GeForce RTX/GTX with proprietary drivers.
- **Developer & Admin Tooling**:
  - `bobzzite-doctor`: Complete system health and runtime diagnostics.
  - `bobzzite-backup`: OSTree deployment pinning, atomic rollback, and dev project snapshots.
  - `bobzzite-devbox`: Zero-configuration Arch and Ubuntu Distrobox containers.
  - `bobzzite-mesh`: Tailscale peer-to-peer networking, Syncthing asset sync, and Waypipe streaming.
  - `build-flatpaks.sh`: Flatpak builder for bob ecosystem apps (`bobzilla`, `bobfilez`).
  - `build-flavors.sh`: Local and automated CI matrix image builder.
- **Desktop Application Launchers & System Binaries**:
  - Desktop entries in `/etc/skel/.local/share/applications/` (`bobzzite-control-center.desktop`, `bobzzite-dev-tools.desktop`, `bobzzite-godot-starter.desktop`).
  - Global executables in `/usr/local/bin`.
- **Custom System Branding**:
  - Plymouth boot splash theme (`branding/plymouth/bobzzite/`).
  - SDDM login greeter theme (`branding/sddm/bobzzite/`).
  - Ambient sound theme (`branding/sounds/bobzzite/`).
  - Fastfetch terminal branding (`config/files/etc/fastfetch/config.jsonc`).
  - Release metadata in `/etc/bobzzite-release`.

## Building the Image

```bash
# Validate local repository configuration
python3 scripts/validate_build.py

# Build using Podman or Docker
podman build -t bobzzite:latest -f Containerfile .

# Or build specific hardware flavor
scripts/build-flavors.sh bobzzite-deck
```

## Installing & Configuring Indie Development Tools

On an installed or rebased system, run:

```bash
# Run full post-installation provisioning
bash scripts/post-install.sh
```

Or run individual setup scripts:

```bash
# Install indie dev tools (Godot, VS Codium, GIMP, Audacity, OBS Studio)
install-indie-tools.sh

# Configure Godot 4 & VS Codium integration
configure-godot-codium.sh

# Launch the unified dashboard
bobzzite-control-center
```

## Governance & Documentation Directory

- [`VISION.md`](VISION.md) — Strategic vision and core pillars.
- [`ROADMAP.md`](ROADMAP.md) — Long-term milestones and ecosystem integration plans.
- [`DEPLOY.md`](DEPLOY.md) — Deployment instructions and rebasing guide.
- [`TODO.md`](TODO.md) — Granular sprint tasks.
- [`MEMORY.md`](MEMORY.md) — Architectural notes and traits.
- [`IDEAS.md`](IDEAS.md) — Aggressive ideas for multiplayer OS and distributed compute.
- [`CHANGELOG.md`](CHANGELOG.md) — Chronological version release log.
- [`HANDOFF.md`](HANDOFF.md) — Context handoff notes for agent resumption.
- [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md) — Comprehensive user guide and FAQ.
- [`docs/HARDWARE_FLAVORS.md`](docs/HARDWARE_FLAVORS.md) — Hardware matrix specifications.
- [`docs/ISO_BUILD.md`](docs/ISO_BUILD.md) — Live and offline bootable ISO creation guide.
- [`docs/DIAGNOSTICS.md`](docs/DIAGNOSTICS.md) — System doctor and health verification.
- [`docs/BACKUP_ROLLBACK.md`](docs/BACKUP_ROLLBACK.md) — Atomic rollback and snapshot management.
- [`docs/MULTIPLAYER.md`](docs/MULTIPLAYER.md) — Mesh networking, Syncthing, and Waypipe workflows.
- [`docs/FLATPAK_PACKAGING.md`](docs/FLATPAK_PACKAGING.md) — Bob ecosystem Flatpak packaging.
