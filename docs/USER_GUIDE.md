# bobzzite User Guide

Welcome to **bobzzite**, the Fedora Atomic-powered operating system built for gaming and indie development.

---

## 1. System Architecture

bobzzite builds upon a layered, atomic container structure:

```
┌────────────────────────────────────────────────────────┐
│                      bobzzite                          │
│   (Wallpapers, Icons, Godot 4 + VS Codium Workflow,    │
│    Indie Game Dev Suite, Bob Ecosystem Applications)   │
└──────────────────────────┬─────────────────────────────┘
                           │ layers on
┌──────────────────────────▼─────────────────────────────┐
│                      Bazzite                           │
│   (Proton GE, Steam Big Picture, Lutris, Heroic,       │
│    Gamescope, Decky Loader, GameMode, Handheld tweaks) │
└──────────────────────────┬─────────────────────────────┘
                           │ layers on
┌──────────────────────────▼─────────────────────────────┐
│                   Universal Blue                       │
│    (NVIDIA / AMD drivers, multimedia codecs, kernel)   │
└──────────────────────────┬─────────────────────────────┘
                           │ layers on
┌──────────────────────────▼─────────────────────────────┐
│                 Fedora Atomic Desktop                  │
│       (Silverblue / Kinoite immutable rpm-ostree)      │
└────────────────────────────────────────────────────────┘
```

---

## 2. Quick Start

### First Boot
On first boot after installing or rebasing to bobzzite:
1. Open your desktop application menu and search for **"Install Indie Dev Suite"**.
2. Alternatively, open any terminal and execute:
   ```bash
   install-indie-tools.sh
   ```
3. This downloads and installs:
   - **Godot Engine 4** (`org.godotengine.Godot`)
   - **VS Codium** (`com.vscodium.codium`)
   - **GIMP** (`org.gimp.GIMP`)
   - **Audacity** (`org.audacityteam.Audacity`)
   - **OBS Studio** (`com.obsproject.Studio`)

4. Configure editor integration and language server connections by running:
   ```bash
   configure-godot-codium.sh
   ```

---

## 3. Indie Game Development Workflow

### Bidirectional Godot 4 & VS Codium Editing
bobzzite comes pre-configured with tight integration between Godot and VS Codium:
1. Double-clicking any `.gd` script inside Godot 4 opens VS Codium automatically with cursor jumping directly to the corresponding line and column.
2. In VS Codium, the Godot Tools extension automatically connects to Godot's GDScript Language Server on port `6005`.
3. Flatpak sandbox socket network permissions are already configured.

### Starting a New Project
You can find a pre-configured starter project template in your home directory under `~/Templates/Godot4_Starter`. Launch it anytime using the **"Godot 4 Starter Project"** application shortcut or run:
```bash
flatpak run org.godotengine.Godot -e --path ~/Templates/Godot4_Starter
```

---

## 4. Gaming on bobzzite

Because bobzzite is layered directly on top of Bazzite:
- **Steam & Proton**: Run Steam to access Proton GE, Steam Big Picture, and GameMode automatically.
- **Heroic Games Launcher**: Play Epic Games and GOG titles with Proton and Wine managers.
- **Lutris**: Manage classic PC titles, emulators, and Windows titles with dedicated runners.
- **Handheld Devices**: Seamless support for Steam Deck quick-access menus, TDP controls, and controller layout mapping.

---

## 5. System Updates & Maintenance

bobzzite is immutable:
- To update the base operating system:
  ```bash
  rpm-ostree update
  ```
- To update user Flatpak applications:
  ```bash
  flatpak update
  ```
- To roll back a system update:
  ```bash
  rpm-ostree rollback
  systemctl reboot
  ```

---

## 6. Troubleshooting & FAQ

### Q: Why Flatpak instead of native RPM packages for tools?
**A:** Flatpak applications run containerized and decoupled from the host operating system. This ensures updates to development tools or game engines will never break base system libraries, and the base system can be rolled back atomically without touching user project files.

### Q: What if Godot and VS Codium cannot communicate over the local LSP port (6005)?
**A:** Run the following permission override:
```bash
flatpak override --user --share=network com.vscodium.codium
flatpak override --user --share=network org.godotengine.Godot
```

### Q: How do I re-run the configuration script safely?
**A:** You can re-run `configure-godot-codium.sh` at any time. It preserves existing keybindings, user configurations, and project settings.

### Q: Can I install additional software using Distrobox?
**A:** Yes! Distrobox is built directly into the base Bazzite layer. You can create Arch, Ubuntu, or Alpine containers seamlessly:
```bash
distrobox create -i archlinux:latest -n dev-box
distrobox enter dev-box
```
