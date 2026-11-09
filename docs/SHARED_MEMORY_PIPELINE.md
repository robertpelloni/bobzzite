# Bobzzite OS Shared Memory & Zero-Copy Pipeline

## Overview

The `bobzzite-shm` utility inspects POSIX shared memory allocations (`/dev/shm`), Wayland `wl_shm` buffer pools, PipeWire locked ring buffers, and Linux kernel `dma-buf` zero-copy texture sharing pipelines. Sub-millisecond rendering and audio latency in game development requires zero-copy data handoffs between game engines (Godot 4), compositors (KWin / Gamescope), and sound servers.

---

## 1. Zero-Copy Architecture Vectors

Bobzzite OS audits four core shared memory subsystems:
- **POSIX Shared Memory (`/dev/shm`)**: Memory-backed tmpfs mount used by Chromium/Electron, Godot multi-process IPC, and build tools.
- **Wayland `wl_shm` Pool**: Shared client-server memory regions allowing UI applications to render software frames directly into compositor-accessible memory.
- **DMA-BUF Subsystem**: Direct memory access buffer sharing between the GPU kernel driver (Mesa RADV/ANV, NVIDIA) and the Wayland compositor without CPU memory copies.
- **PipeWire Audio Ring**: Locked, non-swappable shared memory rings preventing audio xruns under high CPU loads.

---

## 2. CLI Usage

```bash
# Check shared memory mount status and active segment count
bobzzite-shm status

# Run comprehensive shared memory and zero-copy pipeline audit
bobzzite-shm audit
```
