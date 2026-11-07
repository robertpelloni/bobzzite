# Bobzzite OS Game Asset Pipeline & Texture Optimization Guide

## Overview

Bobzzite OS integrates automated asset conditioning pipelines tailored for indie game developers creating 2D and 3D titles with Godot 4 and open-source tooling.

Large uncompressed PNG textures, oversized uncompressed audio streams, and unindexed geometry can cause frame drops and memory pressure on handheld PCs (such as the Steam Deck 16GB unified memory architecture).

---

## The `bobzzite-assets` Optimization Utility

Run `bobzzite-assets` directly from the terminal or trigger it from the **Bobzzite Control Center**:

```bash
# 1. Scan directory and report asset metrics
bobzzite-assets ~/Templates/Godot4_Starter status

# 2. Compress and optimize PNG textures (lossless chunk optimization)
bobzzite-assets ~/Templates/Godot4_Starter optimize-images

# 3. Transcode voice and music WAVs to streaming OGG Vorbis
bobzzite-assets ~/Templates/Godot4_Starter optimize-audio
```

---

## Best Practices for Handheld Hardware

1. **VRAM Texture Compression:**
   - In Godot 4, enable Basis Universal (`VRAM Compressed` or `Basis Universal (KTX2)`) in the Import dock for 3D textures. This reduces VRAM bandwidth consumption by up to 75%.
2. **Audio Streaming:**
   - Sound effects (< 1s duration) should remain 16-bit WAV (Sample playback with zero CPU decompression latency).
   - Background music and ambient loops should be encoded to OGG Vorbis with streaming enabled (`AudioStreamOggVorbis`).
3. **Geometry Decimation:**
   - Keep draw call budgets under 2,000 and polycount under 500,000 active triangles for a solid 60Hz/90Hz refresh rate on the Steam Deck APU.
