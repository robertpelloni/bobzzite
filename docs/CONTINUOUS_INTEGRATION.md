# Bobzzite OS Continuous Integration & Automated Testing Guide

## Overview

Bobzzite OS maintains a fully automated, matrix-based Continuous Integration and Deployment pipeline implemented via GitHub Actions (`.github/workflows/build.yml`) and reproducible locally via `bobzzite-ci` (`scripts/bobzzite-ci.sh`).

---

## CI Pipeline Stages

```
┌────────────────────────────────────────────────────────┐
│                   Stage 1: Validation                  │
├────────────────────────────────────────────────────────┤
│ • scripts/validate_build.py (Paths, Shebangs, Docs)    │
│ • Python compilation (py_compile) & Shell syntax check │
│ • Hardware profile assertion testing (bobzzite-profile)│
│ • Broad hardware compatibility audit (bobzzite-compat) │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│               Stage 2: Multi-Flavor Matrix             │
├────────────────────────────────────────────────────────┤
│ • Matrix targets: bobzzite, bobzzite-deck, nvidia     │
│ • Flavor environment configuration (.flavor-config.env)│
│ • Headless OCI container build (buildx & layer cache)  │
│ • Publication to GHCR (ghcr.io/robertpelloni/*)        │
└────────────────────────────────────────────────────────┘
```

---

## Local CI Execution

Developers can reproduce the exact GitHub Actions verification suite locally without pushing commits:

```bash
# Run complete local CI smoke test pipeline
bobzzite-ci
```

---

## Container Registry Tagging Strategy

Images published to GitHub Container Registry follow this tagging taxonomy:
- `ghcr.io/robertpelloni/<flavor>:latest` : Latest stable build from `main` branch.
- `ghcr.io/robertpelloni/<flavor>:<version>`: Versioned semantic release (e.g. `4.9.0`).
- `ghcr.io/robertpelloni/<flavor>:<sha>`    : Immutable git commit SHA tag for pinpoint rollbacks.
