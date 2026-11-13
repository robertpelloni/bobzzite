# bobzzite

A custom gaming and indie-developer Linux image: a Universal Blue /
Bazzite derivative with bob-ecosystem branding and apps. Built on
Fedora Atomic with rpm-ostree.

```
bobzzite  →  Bazzite  →  Universal Blue  →  Fedora Atomic Desktop
(branding, Godot 4 +   (Proton GE, Steam,   (drivers, codecs,    (Silverblue /
 VS Codium, dev tools)  Heroic, GameMode)    kernel)              Kinoite)
```

## What's in it

- **Base gaming stack** — inherits Proton GE, Steam Big Picture, Heroic,
  GameMode, Gamescope from Bazzite.
- **Indie dev suite** — Godot 4, VS Codium (with Godot Tools LSP
  integration), GIMP, Audacity, OBS Studio via Flatpak; pre-seeded Godot
  4 starter template.
- **Hardware flavors** — `bobzzite` (AMD/Intel), `bobzzite-deck` (Steam
  Deck, ROG Ally, Legion Go), `bobzzite-nvidia` (proprietary drivers);
  hardware-profile comparison and multi-arch rebase tooling in
  `hardware_profiles/` and `bobzzite-deploy`.
- **System tooling** (`scripts/`, 50+ scripts) — `bobzzite-control-center`
  (unified dashboard GUI), `bobzzite-doctor` (diagnostics),
  `bobzzite-backup` (OSTree pinning/rollback), `bobzzite-devbox`
  (Distrobox containers), `bobzzite-mesh` (Tailscale/Syncthing/Waypipe),
  plus hardware audit, HDR, fan, battery, and benchmark scripts.
- **Branding** — Plymouth boot splash, SDDM greeter, sound theme,
  Fastfetch config (`branding/`, `config/`).
- **Docs** — extensive `docs/` (user guide, hardware flavors, ISO build,
  diagnostics, VR, streaming, benchmarks, and more).

## Build

```bash
python3 scripts/validate_build.py
podman build -t bobzzite:latest -f Containerfile .
scripts/build-flavors.sh bobzzite-deck   # specific flavor
```

On an installed system: `bash scripts/post-install.sh` for full
provisioning. See `DEPLOY.md` for the rebase guide.

## Status

Active development through November 2026 (v9.3.0, last commit
2026-11-12). The image definition, branding, and tooling are real and
extensive. No published image registry or booted-install evidence is
documented in this repo — what exists here is the build definition and
scripts, not a verified release artifact.
