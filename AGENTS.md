# AGENTS.md

**Generated:** 2026-01-12 | **Branch:** main | **Version:** 0.1.0

## Overview

**bobzzite** - Custom Bazzite/Universal Blue image for gaming and the bob ecosystem. Built on Fedora Atomic with rpm-ostree.

## Structure

```
bobzzite/
├── README.md              # Project overview
├── AGENTS.md              # This file
├── Containerfile          # Main build definition (like Dockerfile)
├── config/
│   ├── recipe.yml         # Package configuration
│   ├── files/             # Files to include in image
│   └── scripts/           # Build-time scripts
├── branding/              # Wallpapers, icons, themes
├── packages/              # Package lists
├── scripts/               # Utility scripts
└── docs/                  # Documentation
```

## Build System

Universal Blue uses:
- **Containerfile** (OCI/Docker format) for image building
- **GitHub Actions** for CI/CD
- **GHCR** (GitHub Container Registry) for image hosting
- **rpm-ostree** for atomic updates on client

## Key Concepts

1. **Atomic/Immutable** - Base system is read-only, updates are atomic
2. **Layered images** - bobzzite layers on Bazzite which layers on Fedora
3. **Flatpak for apps** - User applications come from Flatpak
4. **Container-native** - Build process uses standard container tools

## Upstream

| Source | URL | Purpose |
|--------|-----|---------|
| Bazzite | github.com/ublue-os/bazzite | Gaming-focused base |
| Universal Blue | github.com/ublue-os | Image building framework |
| Fedora Atomic | fedoraproject.org/atomic-desktops | Core OS |

## Development Workflow

1. Modify `Containerfile` or `config/recipe.yml`
2. Push to GitHub
3. GitHub Actions builds image
4. Test by rebasing a VM to the new image
5. Once stable, tag as release

## LLM Instructions

- This is NOT traditional distro development
- We're building OCI container images, not ISO installers
- Focus on Containerfile and recipe.yml for customization
- Branding goes in branding/ directory
- Test in VMs, not bare metal during development
