# Bobzzite OS - Rootless Container Pod Sandboxing Guide

The `bobzzite-sandbox` utility provides lightweight, unprivileged container execution sandboxes for running untrusted third-party game builds, community mods, or development services without risking host filesystem or network integrity.

## Architecture & Security Model

1. **Unprivileged User Namespaces**:
   Containers execute using Podman rootless user namespaces (`subuid` / `subgid`), ensuring processes cannot escalate privileges on the immutable ostree host.
2. **Resource Constraints via Cgroups v2**:
   - Memory capped at `2GB` by default to avoid system lockups during memory-leak debugging.
   - CPU quota limited to 2 cores maximum.
   - Process limit (`pids-limit=256`) to thwart fork bombs.
3. **Security Flags**:
   - `--security-opt=no-new-privileges` prevents child processes from acquiring additional privileges.
   - Seccomp system call filtering enabled by default.

## Usage

```bash
# Probe sandbox status and kernel user namespace support
bobzzite-sandbox status

# Run a payload or script in an ephemeral sandbox
bobzzite-sandbox run "./my_untrusted_game_build"

# List active sandbox containers
bobzzite-sandbox list

# Purge stopped sandbox containers and ephemeral volumes
bobzzite-sandbox purge
```

## Control Center Integration

`bobzzite-sandbox` is accessible under the **🛡️ System Updates & Diagnostics** card in **Bobzzite Control Center** (`bobzzite-control-center`), providing one-click sandboxing probes and instance management.
