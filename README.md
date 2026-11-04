# bobzzite

bobzzite is a custom gaming and indie developer Linux image: a
Universal Blue / Bazzite derivative with bob-ecosystem branding and apps.
Built on Fedora Atomic with rpm-ostree.

## Features

- **Base Gaming Stack**: Inherits Valve Proton enhancements, Steam Big Picture, Heroic Games Launcher, and GameMode from Bazzite.
- **Indie Development Suite**: Pre-configured automated installation of Godot Engine 4, VS Codium, GIMP, Audacity, and OBS Studio via Flatpak.
- **Godot + VS Codium Integration**: Automated configuration of VS Codium LSP (`geequlim.godot-tools`), GDScript language server port routing (6005), and Flatpak permission overrides for smooth inter-process editing.
- **Immutable & Atomic**: Root filesystem is read-only, atomic updates and rollbacks via `rpm-ostree`.
- **Custom Branding**: Dedicated bob branding assets, wallpapers, icons, and system identity files.

## Project Structure

- `Containerfile` — Main build definition layering on `ghcr.io/ublue-os/bazzite:latest`
- `config/recipe.yml` — BlueBuild image recipe with package and flatpak specifications
- `config/files/` — Configuration files layered onto the root filesystem (e.g. `/etc/bobzzite-release`)
- `branding/` — Wallpapers (`branding/wallpapers/`) and logos (`branding/icons/`)
- `scripts/` — Utility scripts:
  - `scripts/install-indie-tools.sh` — Automated installer for the indie game development tool suite
  - `scripts/configure-godot-codium.sh` — Configures Godot 4 & VS Codium LSP and Flatpak integration
  - `scripts/post-install.sh` — Post-install setup hook
  - `scripts/validate_build.py` — Repo and container build syntax validator
- `docs/` — Architectural research and technical notes

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
# Install indie dev tools (Godot, VS Codium, GIMP, Audacity, OBS Studio)
bash scripts/install-indie-tools.sh

# Configure Godot 4 & VS Codium integration
bash scripts/configure-godot-codium.sh
```

## Rebasing Existing Fedora Atomic / Bazzite

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
systemctl reboot
```
