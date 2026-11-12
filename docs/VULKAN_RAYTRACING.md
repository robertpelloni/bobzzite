# Bobzzite OS Vulkan Ray Tracing Architecture & Hardware Support

## Overview

The `bobzzite-raytracing` utility inspects GPU hardware, direct rendering nodes (`/dev/dri/renderD128`), Vulkan driver stacks, and KHR ray tracing extensions across all supported hardware flavors. Modern game development in Godot 4 and Blender utilizes ray tracing for signed distance field global illumination (SDFGI), screen-space reflections (SSR), and hardware-accelerated bounding volume hierarchy (BVH) traversals.

---

## 1. Supported Vulkan Ray Tracing Extensions

Bobzzite OS verifies four foundational Khronos Vulkan extensions:
- **`VK_KHR_acceleration_structure`**: Builds and manages top-level and bottom-level BVHs on GPU compute pipelines.
- **`VK_KHR_ray_tracing_pipeline`**: Core ray generation, intersection, closest-hit, and miss shading stages.
- **`VK_KHR_ray_query`**: In-shader ray casting within standard compute, fragment, and vertex shaders.
- **`VK_KHR_pipeline_library`**: Pre-compiled shader collection linking for modular game pipelines.

---

## 2. Hardware Flavor Driver Stacks

| Hardware Flavor | Target GPU | Ray Tracing Status | Configuration / Flags |
| :--- | :--- | :--- | :--- |
| **`bobzzite`** | AMD RDNA 2 / 3, Intel Arc | Native hardware ray tracing via Mesa RADV / ANV | `RADV_PERFTEST=rt` (optional tuning) |
| **`bobzzite-deck`** | Steam Deck Aerith / Sephiroth | Emulated / Compute BVH traversal | Native Vulkan 1.3 GLES3/Forward+ fallback |
| **`bobzzite-nvidia`** | GeForce RTX 2000+ | Native hardware RT Cores | Out-of-the-box via NVIDIA Proprietary DKMS |
| **`bobzzite-arm64`** | Adreno / Mali G610 | Compute ray queries / Software SDFGI | Standard Mesa Turnip / Panfrost |

---

## 3. CLI Usage

```bash
# Display basic GPU and Vulkan extension status
bobzzite-raytracing check

# Run complete hardware audit including driver optimization flags
bobzzite-raytracing audit
```
