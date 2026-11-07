# Bobzzite OS Godot 4 GDExtension (C++ & Rust) Architecture Guide

## Overview

For CPU-intensive gameplay systems (procedural world generation, deterministic physics, heavy math, or custom rendering algorithms), GDScript can be complemented with native compiled code via Godot 4's **GDExtension** interface.

GDExtension dynamically loads compiled shared libraries (`.so` on Linux, `.dll` on Windows) at engine startup without requiring engine recompilation.

---

## The `bobzzite-gdextension` Tool

Run `bobzzite-gdextension` directly from the terminal or through the **Bobzzite Control Center**:

```bash
# 1. Inspect existing GDExtensions and compiler toolchains
bobzzite-gdextension ~/Templates/Godot4_Starter status

# 2. Scaffold a C++ GDExtension manifest and directory tree
bobzzite-gdextension ~/Projects/MyGame scaffold-cpp

# 3. Scaffold a godot-rust (Rust) GDExtension project
bobzzite-gdextension ~/Projects/MyGame scaffold-rust
```

---

## Developing with Rust (godot-rust)

Bobzzite OS integrates Distrobox development containers (`bobzzite-devbox`) to provide zero-pollution Rust toolchains (`cargo`, `rustc`):

1. **Enter Developer Container:**
   ```bash
   bobzzite-devbox enter arch
   ```
2. **Build Native Extension:**
   ```bash
   cargo build --release
   cp target/release/librust_extension.so ../bin/
   ```
3. **Run Game in Godot 4:**
   - Launch Godot 4 from Bobzzite Control Center. The custom Rust classes are automatically exposed to GDScript and the Godot Inspector.
