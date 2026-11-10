# Bobzzite OS - Multi-GPU & Dynamic PRIME Render Offload Architecture

## 1. Executive Summary

Modern mobile gaming systems and high-performance workstations often employ heterogeneous multi-GPU configurations:
1. **Integrated GPU (iGPU)**: Low-power Intel Xe/UHD or AMD Radeon 600M/700M/800M series directly integrated onto the CPU die, ideal for desktop compositing, video decoding, and battery conservation.
2. **Discrete GPU (dGPU)**: High-performance NVIDIA GeForce RTX or AMD Radeon RX graphics processor wired via PCIe, engineered for 3D game engines, ray tracing, and compute workloads.

The **Bobzzite Multi-GPU & PRIME Offload Engine** (`bobzzite-prime`) provides seamless automated delegation, allowing desktop compositors (GNOME Wayland / KDE KWin) to run efficiently on the iGPU while demanding games and Godot 4 editor sessions render dynamically on the dGPU without requiring complete system reboots or X11 driver restarts.

---

## 2. Dynamic Offload Protocols

### NVIDIA PRIME Render Offload
On systems equipped with discrete NVIDIA GeForce hardware (`bobzzite-nvidia`), rendering delegation relies on NVIDIA's dynamic offload infrastructure and GLX/EGL vendor dispatch:
```bash
__NV_PRIME_RENDER_OFFLOAD=1
__GLX_VENDOR_LIBRARY_NAME=nvidia
__VK_LAYER_NV_optimus=NVIDIA_only
```
- **Vulkan Routing**: When `__VK_LAYER_NV_optimus=NVIDIA_only` is exported, the Vulkan loader prioritizes NVIDIA ICD drivers while preserving Wayland presentation across the display server.
- **OpenGL Routing**: `libglvnd` routes OpenGL draw calls through `libGLX_nvidia.so.0` instead of Mesa.

### AMD Dynamic DRI PRIME
On hybrid systems pairing Intel or AMD APUs with secondary AMD discrete graphics:
```bash
DRI_PRIME=1
```
Mesa's direct rendering infrastructure queries `/dev/dri/renderD129` (secondary card) to render frames and copies completed buffers back to `/dev/dri/renderD128` (primary display card) via Linux kernel `dma-buf` zero-copy memory pipelines.

---

## 3. Command Line Interface

```bash
# Display detected GPU topology and active offload protocol
bobzzite-prime status

# Print shell export statements for terminal session binding
bobzzite-prime env

# Launch any game, benchmark, or Godot 4 directly on discrete GPU
bobzzite-prime offload godot4 -e

# Export structured JSON state for automation and Control Center UI
bobzzite-prime json
```

---

## 4. Control Center Integration

All dynamic offload capabilities are exposed in the **Bobzzite Control Center** (`bobzzite-control-center`) under the **🎮 Hardware & Gaming Profiles** panel.
