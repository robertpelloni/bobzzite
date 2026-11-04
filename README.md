# bobzzite

bobzzite is a custom gaming and indie developer Linux image: a
Universal Blue / Bazzite derivative with bob-ecosystem branding and apps.
Built on Fedora Atomic with rpm-ostree.

## Features

- **Base Gaming Stack**: Inherits Valve Proton enhancements, Steam Big Picture, Heroic Games Launcher, and GameMode from Bazzite.
- **Indie Development Suite**: Pre-configured automated installation of Godot Engine 4, VS Codium, GIMP, Audacity, and OBS Studio via Flatpak.
- **Bidirectional Godot + VS Codium Workflow**:
  - VS Codium is configured with Godot Tools LSP settings (`127.0.0.1:6005`).
  - Automated extension installation for `geequlim.godot-tools`.
  - Godot 4 editor template (`editor_settings-4.tres`) automatically delegates external script editing to VS Codium with project and cursor line/column arguments.
  - Pre-seeded Godot 4 project starter template in `/etc/skel/Templates/Godot4_Starter`.
- **Desktop Application Launchers**:
  - Desktop entries in `/etc/skel/.local/share/applications/` for one-click dev tool provisioning and starter project launching.
- **User Documentation**: Complete beginner-friendly guide available in [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md).
- **Immutable & Atomic**: Root filesystem is read-only, atomic updates and rollbacks via `rpm-ostree`.
- **Custom Branding**: Dedicated bob branding assets, wallpapers, icons, and system identity files.

## Project Structure

- `Containerfile` — Main build definition layering on `ghcr.io/ublue-os/bazzite:latest`
- `config/recipe.yml` — BlueBuild image recipe with package and flatpak specifications
- `config/files/` — Configuration files layered onto the root filesystem:
  - `/etc/bobzzite-release` — OS release metadata
  - `/etc/skel/.config/godot/editor_settings-4.tres` — Default Godot 4 external editor settings
  - `/etc/skel/Templates/Godot4_Starter/` — Starter Godot 4 project skeleton
  - `/etc/skel/.local/share/applications/` — User desktop launcher shortcuts
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
bash scripts/install-indie-tools.sh

# Configure Godot 4 & VS Codium integration
bash scripts/configure-godot-codium.sh
```

See [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md) for full step-by-step guidance.

## Rebasing Existing Fedora Atomic / Bazzite

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
systemctl reboot
```
