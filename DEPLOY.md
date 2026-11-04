# bobzzite Deployment & Building Guide

## Build Requirements
- Podman or Docker engine installed.
- Red Hat `buildah` (optional, for native OCI building as used in GitHub Actions).

## Local Container Image Build

To test build the image locally using Docker or Podman:

```bash
# Using Podman
podman build -t bobzzite:latest -f Containerfile .

# Using Docker
docker build -t bobzzite:latest -f Containerfile .
```

## Validating Configuration

Run the project build and recipe validator:

```bash
python3 scripts/validate_build.py
```

## Deploying to a Fedora Atomic / Bazzite Host

On an existing Fedora Silverblue, Kinoite, or Bazzite workstation:

```bash
# Rebase system to the published bobzzite image
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest

# Reboot into bobzzite
systemctl reboot
```

## Post-Rebase Provisioning & Global Tools

After the initial boot into bobzzite, user tools are globally accessible:

### Option A: Graphical Desktop Launchers
- Launch **"Install Indie Dev Suite"** from the application menu to automatically download and configure Godot 4, VS Codium, GIMP, Audacity, and OBS Studio.
- Launch **"Godot 4 Starter Project"** to immediately open the starter template inside Godot 4.

### Option B: System Command-Line Binaries
Because helper utilities are installed into `/usr/local/bin`, you can run them directly from any terminal session:

```bash
# Install indie dev suite (Godot, VS Codium, GIMP, Audacity, OBS Studio)
install-indie-tools.sh

# Configure Godot 4 & VS Codium LSP / bidirectional integration
configure-godot-codium.sh

# Or run the repo post-install provisioning hook
bash scripts/post-install.sh
```

## Rolling Back

If rollback is necessary:

```bash
rpm-ostree rollback
systemctl reboot
```
