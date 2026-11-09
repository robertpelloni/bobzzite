# AGENTS.md - Instructions for Autonomous Agents Working on Bobzzite OS

Welcome to the Bobzzite OS repository. This document outlines architectural standards, build requirements, and governance conventions.

## Repository Overview
Bobzzite OS is a customized, atomic gaming and indie developer operating system layered on Fedora Silverblue via Universal Blue (`bazzite`).

## Key Principles & Conventions
1. **Mirrored Script Structure**:
   - Any executable system script placed under `scripts/bobzzite-<name>.sh` (or `.py`) must be mirrored to `config/files/usr/local/bin/bobzzite-<name>`.
   - All scripts must have executable permissions (`chmod +x`).
2. **Build Validation**:
   - All code, scripts, configurations, and documentation must pass `python3 scripts/validate_build.py` with 0 errors.
   - `docker build --check -f Containerfile .` must always pass.
3. **Hardware Profiles Governance**:
   - Hardware flavor definitions are maintained in `hardware_profiles/` and mirrored to `config/files/usr/share/bobzzite/hardware_profiles/`.
   - Profile schemas must remain strictly synchronized with current release versions.
4. **Documentation**:
   - All new tools or features must be documented under `docs/` and referenced in `CHANGELOG.md`, `ROADMAP.md`, `TODO.md`, and `MEMORY.md`.
