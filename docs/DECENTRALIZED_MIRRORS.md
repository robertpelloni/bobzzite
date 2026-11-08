# Bobzzite OS - Decentralized Package Mirror Synchronization Guide (IPFS)

The `bobzzite-ipfs` utility enables peer-to-peer (P2P) mirror distribution, layer caching, and cryptographic content verification of Bobzzite OS artifacts, export templates, and Flatpak bundles using the InterPlanetary File System (IPFS) and the IPFS Name System (IPNS).

## Architectural Principles

1. **Content Addressing (CIDs)**:
   All container tarballs, export templates, and game packages are hashed with SHA-256 / multihash algorithms, generating immutable Content Identifiers (CIDs).
2. **Bandwidth Offloading & High Availability**:
   Indie dev studios or LAN playtest events can seed package layers locally over mDNS swarm peering, allowing ultra-fast updates without saturating WAN connections.
3. **Censorship Resistance & Offline Recovery**:
   When central OCI registries are unavailable or rate-limited, packages can be retrieved through public gateways (`https://ipfs.io/ipfs/`) or local Kubo nodes.

## Usage

```bash
# Query local IPFS daemon and swarm status
bobzzite-ipfs status

# Pin a standalone game package or Godot export template
bobzzite-ipfs pin my-game-export.tar.gz

# Verify CID integrity across the swarm
bobzzite-ipfs verify bafybeibobzzitepackagehash123456

# Publish repository release manifest to IPNS
bobzzite-ipfs publish
```

## Control Center Integration

`bobzzite-ipfs` is exposed under the **System Updates & Diagnostics** card in the **Bobzzite Control Center** (`bobzzite-control-center`), allowing instant status probing and swarm peer inspection.
