# bobzzite Multiplayer Computing & Game Streaming

bobzzite includes tools to facilitate decentralized multiplayer gaming, game jam collaboration, and low-latency remote development.

---

## 1. Mesh Networking (Tailscale)

bobzzite enables zero-configuration mesh networking across disparate LANs and cloud workstations:

```bash
# Connect machine to your mesh network
bobzzite-mesh up

# Check connected peers
bobzzite-mesh status
```

Peers on your mesh network can connect directly for multiplayer playtesting and LAN game servers without complex port-forwarding.

---

## 2. P2P Asset & Project Synchronization (Syncthing)

Keep game development repositories, Godot assets, Blender models, and audio samples synchronized peer-to-peer across workstations:

```bash
# Enable background asset sync
bobzzite-mesh sync-enable
```

Access the local management dashboard at `http://localhost:8384`.

---

## 3. Remote Window & Application Streaming (Waypipe)

Because bobzzite runs native Wayland across KDE Plasma and Gamescope sessions, developers can stream individual graphical windows or Godot test builds across machines over SSH:

```bash
# Stream remote Godot application window over SSH
waypipe ssh developer@mesh-peer flatpak run org.godotengine.Godot
```
