# Bobzzite OS Godot 4 & VS Codium Bidirectional Workflow & DAP Guide

## Architecture Overview

Bobzzite OS pairs **Godot Engine 4** with **VS Codium** as the first-class external script editor, code intelligence engine, and real-time debugger.

```
┌─────────────────────────────────┐               ┌─────────────────────────────────┐
│         VS Codium (Flatpak)      │               │       Godot Engine 4 (Flatpak)  │
│                                 │  LSP (:6005)  │                                 │
│   • GDScript Autocomplete       ├──────────────►│   • GDScript Language Server    │
│   • Hover Docs & Signatures     │               │   • Scene & Asset Importer      │
│   • Breakpoints / Stepping      │  DAP (:6006)  │                                 │
│   • Variable Inspection         ├──────────────►│   • Debug Adapter Daemon        │
└─────────────────────────────────┘               └─────────────────────────────────┘
```

---

## 1. Language Server Protocol (LSP) Configuration

- **Host & Port:** `127.0.0.1:6005`
- **Extension:** `geequlim.godot-tools`
- **Settings:**
  - `godotTools.lsp.serverHost`: `127.0.0.1`
  - `godotTools.lsp.serverPort`: `6005`

When a Godot project is open, Godot listens on TCP port `6005`. Opening any `.gd` file in VS Codium immediately connects to Godot, enabling real-time class autocompletion, type hinting, and signal navigation.

---

## 2. Debug Adapter Protocol (DAP) Integration

- **Host & Port:** `127.0.0.1:6006`
- **Debugger Configurations:** Defined in `.vscode/launch.json`:
  1. **Play Godot 4 Current Project (`F5`):** Starts game instance and attaches Codium's debugger.
  2. **Play Godot 4 Current Scene (`Ctrl+F5`):** Launches and debugs the active scene tab.
- **Capabilities:**
  - Set inline breakpoints in GDScript.
  - Step into, step over, and step out of functions during live game execution.
  - Inspect call stacks, local node properties, and global singletons.

---

## 3. Flatpak Socket & IPC Sandbox Permissions

Because both Godot 4 and VS Codium run inside Flatpak sandboxes, Bobzzite configures shared IPC permissions:

```bash
# Verify or apply Flatpak overrides
flatpak override --user --share=network com.vscodium.codium
flatpak override --user --share=ipc com.vscodium.codium
flatpak override --user --share=network org.godotengine.Godot
flatpak override --user --share=ipc org.godotengine.Godot
```

Run `configure-godot-codium.sh` at any time to automatically ensure these settings are active.
