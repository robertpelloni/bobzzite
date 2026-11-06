# Bobzzite Multi-Hardware Flavor Architecture & Matrix

## Target Matrix Overview

Bobzzite OS generates three specialized atomic OS images built on Fedora Atomic and Universal Blue:

| Flavor | Upstream Base Image | Target Hardware Platforms | Default Session / Desktop |
|---|---|---|---|
| `bobzzite` | `ghcr.io/ublue-os/bazzite:latest` | Desktop & Laptop AMD Radeon, Intel Arc / UHD GPUs | KDE Plasma (Desktop Mode) |
| `bobzzite-deck` | `ghcr.io/ublue-os/bazzite-deck:latest` | Valve Steam Deck (LCD & OLED), ASUS ROG Ally, Lenovo Legion Go | Steam Gamepad UI + KDE Plasma |
| `bobzzite-nvidia` | `ghcr.io/ublue-os/bazzite-nvidia:latest` | Desktop & Mobile NVIDIA RTX 3000/4000 & GTX GPUs | KDE Plasma (NVIDIA Wayland / X11) |

---

## Flavor Build Automation: `scripts/build-flavors.sh`

The `scripts/build-flavors.sh` automation engine supports multiple operational modes:

```bash
# 1. Output flavor hardware manifest and target metadata
./scripts/build-flavors.sh all manifest

# 2. Syntax and base argument dry-run check
./scripts/build-flavors.sh all dry-run

# 3. Build a specific hardware target
./scripts/build-flavors.sh bobzzite-deck build 2.3.0

# 4. Build all flavors sequentially
./scripts/build-flavors.sh all build 2.3.0
```

---

## Continuous Integration Build Pipeline

In `.github/workflows/build.yml`, hardware flavors are built concurrently via a GitHub Actions matrix strategy:

```yaml
strategy:
  matrix:
    flavor:
      - name: bobzzite
        base: ghcr.io/ublue-os/bazzite:latest
      - name: bobzzite-deck
        base: ghcr.io/ublue-os/bazzite-deck:latest
      - name: bobzzite-nvidia
        base: ghcr.io/ublue-os/bazzite-nvidia:latest
```

All images automatically receive `:latest` and semantic version tags (`:${{ steps.version.outputs.version }}`) pushed to GHCR upon merging to `main`.
