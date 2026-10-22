# bobzzite

bobzzite is the *definition* of a custom gaming Linux image: a
Universal Blue / Bazzite derivative with bob-ecosystem branding and apps.
The repo is tiny (~10 KB) — a `Containerfile`, a `config/recipe.yml`,
`config/scripts/`, a `scripts/post-install.sh`, a GitHub Actions workflow,
and docs.

**It does not currently build.** The `Containerfile` starts
`FROM ghcr.io/ublue-os/bazzite:latest` and then copies paths that are not in
this repository:

- `COPY config/files /` — there is no `config/files/` directory
- `COPY branding/wallpapers …` and `COPY branding/icons …` — there is no
  `branding/` directory

Until those exist, the image build fails at the copy steps, and there is no
published `ghcr.io/robertpelloni/bobzzite` image to rebase to — the rebase
and ISO-install instructions in the old README described the intended end
state, not something that exists. The old README also documented a larger
tree (`packages/`, `branding/plymouth/`, …) than the repo contains.

## What is here

- `Containerfile` — Bazzite base + config/branding copy steps + a build
  script run (see above for the missing pieces)
- `config/recipe.yml` — image recipe (782 bytes)
- `config/scripts/` — build-time scripts invoked by the Containerfile
- `scripts/post-install.sh` — post-install customization stub
- `.github/workflows/` — the image-build workflow from the Universal Blue
  template

## If it were finished

```bash
podman build -t bobzzite .   # local test build
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
```

## Status

Skeleton, dormant since the July 2026 checkpoint commits (latest activity
is an automated agent checkpoint, 2026-10-19). Upstream: Bazzite
(https://bazzite.gg) on Fedora Atomic via Universal Blue.
