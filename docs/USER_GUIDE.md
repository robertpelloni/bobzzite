# bobzzite User Guide

Welcome to **bobzzite**, the Fedora Atomic-powered operating system built for gaming and indie development.

---

## 1. Quick Start

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

## 2. Indie Game Development Workflow

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

## 3. Gaming on bobzzite

Because bobzzite is layered directly on top of Bazzite:
- **Steam & Proton**: Run Steam to access Proton GE, Steam Big Picture, and GameMode automatically.
- **Heroic Games Launcher**: Play Epic Games and GOG titles with Proton and Wine managers.
- **Lutris**: Manage classic PC titles, emulators, and Windows titles with dedicated runners.

---

## 4. System Updates & Maintenance

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

## 5. Troubleshooting & FAQ

### Flatpak Permission Issues
If Godot and VS Codium cannot communicate over the local LSP port (6005):
```bash
flatpak override --user --share=network com.vscodium.codium
flatpak override --user --share=network org.godotengine.Godot
```

### Re-running Configuration
You can re-run `configure-godot-codium.sh` at any time without overwriting personal keybindings or custom settings outside of the Godot Tools configuration.
