# Bobzzite OS - Godot 4 Shader Pre-Compilation Cache Guide

The `bobzzite-shader-cache` utility manages Vulkan SPIR-V shader compilation pipelines for Godot 4 projects, eliminating runtime shader compilation stutter and frame drops on handhelds (Steam Deck) and desktop GPUs.

## Problem Context

In modern Vulkan renderers (Godot 4 Forward+ / Mobile), shaders are compiled on-demand the first time a mesh, particle system, or visual effect enters the camera viewport. On handheld APUs or mobile GPUs, compiling complex PBR shaders on the fly causes visible frame drops (shader compilation hitching).

## Architecture & Workflow

1. **Shader Discovery & Pre-Warming**:
   Scans `.gdshader`, `.tres`, and visual shader graphs in the project directory and invokes headless Godot to force SPIR-V bytecode generation into the host driver cache (`MESA_GLSL_CACHE_DIR` / `VK_PIPELINE_CACHE`).
2. **Distribution & Bundling**:
   Allows exporting the pre-warmed cache bundle alongside the game export package for zero-stutter first-time player experiences.
3. **Cache Maintenance**:
   Provides safe cleanup and size audits of the persistent user shader cache.

## Usage

```bash
# Check shader cache size and compilation statistics
bobzzite-shader-cache status

# Pre-warm all shaders for a project before playtesting
bobzzite-shader-cache prewarm ~/Templates/Godot4_Starter

# Export pre-compiled shader bundle
bobzzite-shader-cache export

# Purge corrupted or obsolete shader cache
bobzzite-shader-cache purge
```

## Control Center Integration

`bobzzite-shader-cache` is exposed under the **★ High-Value Quick Actions** panel in **Bobzzite Control Center** (`bobzzite-control-center`), allowing instant shader pre-warming with a single click.
