# bobzzite System Diagnostics & Health Guide

The `bobzzite-doctor` utility performs automated health verification across all key subsystems of bobzzite.

---

## 1. Running Diagnostics

### From the Bobzzite Control Center
Click **"System Doctor"** in the Control Center dashboard to run diagnostics asynchronously with real-time output in the status console.

### From the Command Line
```bash
bobzzite-doctor
```

---

## 2. Verified Subsystems

1. **OS Identity**: Reads `/etc/bobzzite-release` to verify active build version and gaming edition variant.
2. **Atomic Deployment**: Queries `rpm-ostree status` to check deployment pinning, layered packages, and pending staging commits.
3. **Graphics & Display**: Checks GPU bus enumeration (`lspci`) and confirms Wayland/X11 compositor session type.
4. **GameMode Optimization**: Checks whether Feral GameMode (`gamemoded`) governor daemon is responsive.
5. **Indie Tool Runtimes**: Validates the presence of Godot 4, VS Codium, GIMP, Audacity, and OBS Studio Flatpaks.
