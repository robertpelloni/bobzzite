# Bobzzite OS Build Health & Quality Assurance Specification

## Overview

Bobzzite OS maintains strict build integrity, reproducibility, and container structure standards. Every build, local test, and pull request is systematically validated against the `bobzzite-validate` suite (`scripts/validate_build.py`).

---

## Validation Metrics & Checks

The automated validation tool inspects three core subsystems:

### 1. Containerfile COPY Source Path Resolution
- Parses all `COPY` directives within `Containerfile`.
- Verifies that every referenced source path (`config/files/`, `branding/wallpapers/`, `branding/icons/`, `branding/plymouth/`, `branding/sddm/`, `branding/sounds/`, `config/scripts/`) exists in the repository context before build execution.
- Prevents container build failures before Docker or Podman stages start.

### 2. Script Executability & Shebang Governance
- Verifies that all installation scripts, configuration tools, and user helper utilities have executable permissions (`+x`).
- Ensures valid POSIX shebang headers (`#!/usr/bin/env bash` or `#!/usr/bin/env python3`).
- Validates that system utilities installed into `/usr/local/bin` have matching counterparts.

### 3. Documentation Governance & Integrity
- Verifies the existence, non-emptiness, and formatting of all core governance documents (`VERSION.md`, `ROADMAP.md`, `TODO.md`, `VISION.md`, `MEMORY.md`, `DEPLOY.md`, `IDEAS.md`, `CHANGELOG.md`, `HANDOFF.md`, `README.md`, `AGENTS.md`).
- Confirms all technical guides in `docs/` (`USER_GUIDE.md`, `ISO_BUILD.md`, `MULTIPLAYER.md`, `DIAGNOSTICS.md`, `HARDWARE_FLAVORS.md`, `BACKUP_ROLLBACK.md`, `FLATPAK_PACKAGING.md`, `PERFORMANCE_TUNING.md`, `CONTROLLER_SUPPORT.md`, `MAINTENANCE.md`, `BENCHMARKS.md`, `AUDIO_SETUP.md`, `STREAMING.md`, `BUILD_HEALTH.md`) are present and populated.

---

## Invoking Build Health Diagnostics

Run directly from the terminal or trigger via the **Bobzzite Control Center**:

```bash
# Terminal validation
bobzzite-validate
```
