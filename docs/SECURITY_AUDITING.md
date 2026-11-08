# Bobzzite OS Security & Container Hardening Guide

## Overview

Bobzzite OS incorporates multi-layered security defenses built upon Fedora Silverblue's immutable ostree architecture:

1. **Read-Only System Immutability**:
   - `/usr` and root system libraries are mounted strictly read-only (`ro`).
   - Changes cannot overwrite core binaries at runtime.
2. **Mandatory Access Control (SELinux)**:
   - Enforcing policies protect system daemons, user homes, and container boundaries.
3. **Application Sandboxing via Flatpak**:
   - Indie development tools (Godot 4, VS Codium, GIMP, Blender) run isolated in unprivileged Flatpak sandboxes.
4. **Automated Security Auditing (`bobzzite-security`)**:
   - Verifies root immutability, audits SUID/SGID elevation binaries, and checks user namespace configurations.

---

## CLI Security Auditor

```bash
# Run comprehensive security audit
bobzzite-security audit

# Inspect SUID/SGID elevated binaries
bobzzite-security suid
```
