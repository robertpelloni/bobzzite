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
- **Desktop Application Launchers & System Binaries**:
  - Desktop entries in `/etc/skel/.local/share/applications/` for one-click dev tool provisioning and starter project launching.
  - Global executables installed in `/usr/local/bin` (`install-indie-tools.sh`, `configure-godot-codium.sh`).
- **Automated CI & Validation**:
  - GitHub Actions build workflow automatically validates file references, permissions, and documentation before container image generation.
  - Local validator script: `python3 scripts/validate_build.py`.
- **User Documentation**: Complete beginner-friendly guide available in [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md).
- **Immutable & Atomic**: Root filesystem is read-only, atomic updates and rollbacks via `rpm-ostree`.
- **Custom Branding**: Dedicated bob branding assets, wallpapers, icons, and system identity files.

## Hardware Compatibility

- **Desktop Gaming PCs**: Full native support for AMD Radeon, Intel Arc, and NVIDIA GeForce GPUs.
- **Handheld Gaming PCs**: Inherits Bazzite's hardware integrations for Valve Steam Deck (LCD & OLED), ASUS ROG Ally, Lenovo Legion Go, and GPD Win devices.

## Project Structure

- `Containerfile` — Main build definition layering on `ghcr.io/ublue-os/bazzite:latest`
- `config/recipe.yml` — BlueBuild image recipe with package and flatpak specifications
- `config/files/` — Configuration files layered onto the root filesystem:
  - `/etc/bobzzite-release` — OS release metadata
  - `/etc/skel/.config/godot/editor_settings-4.tres` — Default Godot 4 external editor settings
  - `/etc/skel/Templates/Godot4_Starter/` — Starter Godot 4 project skeleton
  - `/etc/skel/.local/share/applications/` — User desktop launcher shortcuts
  - `/usr/local/bin/` — Global helper scripts (`install-indie-tools.sh`, `configure-godot-codium.sh`)
- `branding/` — Wallpapers (`branding/wallpapers/`) and logos (`branding/icons/`)
- `scripts/` — Utility scripts:
  - `scripts/install-indie-tools.sh` — Automated installer for the indie game development tool suite
  - `scripts/configure-godot-codium.sh` — Configures Godot 4 & VS Codium LSP, extensions, and Flatpak integration
  - `scripts/post-install.sh` — Post-install setup hook
  - `scripts/validate_build.py` — Repo and container build syntax validator
- `docs/` — User guide (`docs/USER_GUIDE.md`), architectural research, and technical notes

## Building the Image

```bash
# Validate local repository configuration
python3 scripts/validate_build.py

# Build using Podman or Docker
podman build -t bobzzite:latest -f Containerfile .
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
```

See [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md) for full step-by-step guidance.

## Governance & Documentation Suite

- [`VISION.md`](VISION.md) — Strategic vision and core pillars.
- [`ROADMAP.md`](ROADMAP.md) — Long-term milestones and ecosystem integration plans.
- [`DEPLOY.md`](DEPLOY.md) — Deployment instructions and rebasing guide.
- [`TODO.md`](TODO.md) — Granular sprint tasks.
- [`MEMORY.md`](MEMORY.md) — Architectural notes and traits.
- [`IDEAS.md`](IDEAS.md) — Aggressive ideas for multiplayer OS and distributed compute.
- [`CHANGELOG.md`](CHANGELOG.md) — Chronological version release log.
- [`HANDOFF.md`](HANDOFF.md) — Context handoff notes for agent resumption.

## Rebasing Existing Fedora Atomic / Bazzite

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
systemctl reboot
```
