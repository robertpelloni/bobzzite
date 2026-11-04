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

## Post-Rebase Provisioning

After the initial boot into bobzzite, run the post-install provisioning pipeline:

```bash
# Run full post-installation configuration
bash scripts/post-install.sh
```

This automatically:
1. Verifies and configures the Flathub remote.
2. Installs the indie game development tool suite via Flatpak (Godot 4, VS Codium, GIMP, Audacity, OBS Studio) using `scripts/install-indie-tools.sh`.
3. Configures VS Codium and Godot 4 integration using `scripts/configure-godot-codium.sh` (GDScript language server port 6005, settings, and socket permissions).

## Rolling Back

If rollback is necessary:

```bash
rpm-ostree rollback
systemctl reboot
```
