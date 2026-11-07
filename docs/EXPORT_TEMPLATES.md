# Bobzzite OS Custom Godot 4 Export Templates Guide

## Overview

Godot 4 default export templates bundle all engine features (Vulkan rendering, 3D physics, navigation, WebSockets, OpenXR). For 2D games or lightweight indie projects, building custom export templates with **SCons** drastically reduces binary size (from ~90MB down to ~25MB) and improves cold startup times on handheld PCs.

---

## Compiling Custom Templates: `bobzzite-export-templates`

```bash
# Verify compiler toolchain and template parameters
bobzzite-export-templates linuxbsd release

# Profile Windows export template parameters
bobzzite-export-templates windows release
```

---

## Recommended SCons Build Options for Size Minimization

When building from the Godot Engine source code (`godot-build` container or Distrobox):

```bash
# 2D Optimized Binary with Full LTO (Link-Time Optimization)
scons platform=linuxbsd \
      target=template_release \
      arch=x86_64 \
      optimize=size \
      lto=full \
      disable_3d=yes \
      disable_advanced_gui=yes \
      module_text_server_adv_enabled=no
```

### Destination Directory
Place compiled templates in:
`~/.local/share/godot/export_templates/<version>/linux_release.x86_64`
