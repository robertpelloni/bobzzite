#!/usr/bin/env python3
"""
Bobzzite Control Center
Unified Single-Window Management Dashboard and System Utilities for bobzzite OS.
"""

import os
import sys
import subprocess
import threading
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext

class ToolTip:
    """Creates a tooltip marker for a given widget."""
    def __init__(self, widget, text):
        self.widget = widget
        self.text = text
        self.tip_window = None
        widget.bind("<Enter>", self.show_tip)
        widget.bind("<Leave>", self.hide_tip)

    def show_tip(self, event=None):
        if self.tip_window or not self.text:
            return
        x = self.widget.winfo_rootx() + 20
        y = self.widget.winfo_rooty() + self.widget.winfo_height() + 5
        self.tip_window = tw = tk.Toplevel(self.widget)
        tw.wm_overrideredirect(True)
        tw.wm_geometry(f"+{x}+{y}")
        label = tk.Label(
            tw,
            text=self.text,
            justify=tk.LEFT,
            background="#1e293b",
            foreground="#f8fafc",
            relief=tk.SOLID,
            borderwidth=1,
            font=("Segoe UI", 9, "normal"),
            padx=8,
            pady=4
        )
        label.pack(ipadx=1)

    def hide_tip(self, event=None):
        if self.tip_window:
            self.tip_window.destroy()
            self.tip_window = None


class BobzziteControlCenter:
    def __init__(self, root):
        self.root = root
        self.root.title("bobzzite Control Center")
        self.root.geometry("820x680")
        self.root.minsize(740, 560)
        self.root.configure(bg="#0b0f19")

        self.style = ttk.Style()
        self.style.theme_use("clam")
        self._configure_styles()

        self._build_header()
        self._build_main_content()
        self._build_log_console()
        self._build_status_bar()

    def _configure_styles(self):
        self.style.configure(".", background="#0b0f19", foreground="#f8fafc", font=("Segoe UI", 10))
        self.style.configure("Header.TLabel", font=("Segoe UI", 18, "bold"), foreground="#00d2ff")
        self.style.configure("SubHeader.TLabel", font=("Segoe UI", 10), foreground="#94a3b8")
        self.style.configure("TLabelframe", background="#111827", foreground="#00d2ff", bordercolor="#374151")
        self.style.configure("TLabelframe.Label", font=("Segoe UI", 11, "bold"), foreground="#00d2ff", background="#111827")
        self.style.configure("Accent.TButton", font=("Segoe UI", 10, "bold"), background="#0284c7", foreground="#ffffff")
        self.style.map("Accent.TButton", background=[("active", "#0369a1")])
        self.style.configure("Danger.TButton", font=("Segoe UI", 10, "bold"), background="#b91c1c", foreground="#ffffff")
        self.style.map("Danger.TButton", background=[("active", "#991b1b")])

    def _build_header(self):
        header_frame = tk.Frame(self.root, bg="#111827", padx=16, pady=12, relief=tk.RAISED, bd=1)
        header_frame.pack(fill=tk.X, side=tk.TOP)

        title = ttk.Label(header_frame, text="⚡ BOBZZITE CONTROL CENTER", style="Header.TLabel")
        title.pack(anchor=tk.W)

        subtitle = ttk.Label(header_frame, text="Unified Gaming & Indie Development System Hub", style="SubHeader.TLabel")
        subtitle.pack(anchor=tk.W)

    def _build_main_content(self):
        container = tk.Frame(self.root, bg="#0b0f19", padx=12, pady=12)
        container.pack(fill=tk.BOTH, expand=True)

        # Section 1: High-Value Quick Actions
        quick_frame = ttk.LabelFrame(container, text=" ★ High-Value Quick Actions ", padding=10)
        quick_frame.pack(fill=tk.X, pady=(0, 10))

        btn_grid = tk.Frame(quick_frame, bg="#111827")
        btn_grid.pack(fill=tk.X)

        b1 = ttk.Button(btn_grid, text="📦 Provision Indie Dev Suite", style="Accent.TButton",
                        command=lambda: self.run_async("install-indie-tools.sh", "Provisioning Flatpak Tools..."))
        b1.grid(row=0, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(b1, "Downloads and installs Godot 4, VS Codium, GIMP, Audacity, and OBS Studio via Flatpak.")

        b2 = ttk.Button(btn_grid, text="🎮 Launch Godot 4 Starter",
                        command=lambda: self.run_async("flatpak run org.godotengine.Godot -e --path ~/Templates/Godot4_Starter", "Launching Godot Starter..."))
        b2.grid(row=0, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(b2, "Opens the pre-configured bobzzite starter template inside Godot Engine 4.")

        b3 = ttk.Button(btn_grid, text="⚙️ Configure Godot-Codium LSP",
                        command=lambda: self.run_async("configure-godot-codium.sh", "Configuring LSP and editor linking..."))
        b3.grid(row=0, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(b3, "Wires Godot GDScript LSP port 6005, installs extensions, and sets Flatpak socket permissions.")

        b4 = ttk.Button(btn_grid, text="📦 Package Game Project",
                        command=lambda: self.run_async("bobzzite-package", "Packaging Godot 4 game project to Linux release..."))
        b4.grid(row=1, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(b4, "Builds and exports standalone Linux binaries and resource packages headlessly.")

        b5 = ttk.Button(btn_grid, text="🎨 Optimize Game Assets",
                        command=lambda: self.run_async("bobzzite-assets", "Analyzing and optimizing textures & audio..."))
        b5.grid(row=1, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(b5, "Scans and optimizes PNG textures and transcodes streaming audio for Godot projects.")

        b6 = ttk.Button(btn_grid, text="🌐 Localization & i18n",
                        command=lambda: self.run_async("bobzzite-i18n", "Scanning translation tables and string catalogs..."))
        b6.grid(row=1, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(b6, "Extracts, generates, and compiles multi-language CSV and gettext translation tables.")

        b7 = ttk.Button(btn_grid, text="🧪 Run Game Tests",
                        command=lambda: self.run_async("bobzzite-test", "Running headless game unit tests & syntax checks..."))
        b7.grid(row=2, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(b7, "Runs headless GDScript syntax validation, scene integrity scans, and unit tests.")

        b8 = ttk.Button(btn_grid, text="⚙️ Export Templates",
                        command=lambda: self.run_async("bobzzite-export-templates", "Inspecting Godot custom template parameters..."))
        b8.grid(row=2, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(b8, "Compiles and configures custom, size-optimized Godot 4 export templates.")

        b9 = ttk.Button(btn_grid, text="⚡ GDExtension (C++/Rust)",
                        command=lambda: self.run_async("bobzzite-gdextension", "Scanning GDExtension native manifests..."))
        b9.grid(row=3, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(b9, "Scaffolds and validates high-performance native C++ and godot-rust GDExtensions.")

        b10 = ttk.Button(btn_grid, text="🔥 Pre-warm Shader Cache",
                         command=lambda: self.run_async("if command -v bobzzite-shader-cache >/dev/null 2>&1; then bobzzite-shader-cache prewarm Templates/Godot4_Starter; elif [ -f scripts/bobzzite-shader-cache.sh ]; then ./scripts/bobzzite-shader-cache.sh prewarm Templates/Godot4_Starter; else echo 'Shader cache script not found'; fi", "Pre-warming Vulkan SPIR-V Shader Pipeline Caches..."))
        b10.grid(row=3, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(b10, "Pre-compiles Godot 4 shaders to eliminate runtime micro-stutter and frame drops.")

        btn_grid.columnconfigure(0, weight=1)
        btn_grid.columnconfigure(1, weight=1)
        btn_grid.columnconfigure(2, weight=1)

        # Section 2: System Maintenance & Diagnostics
        maint_frame = ttk.LabelFrame(container, text=" 🛡️ System Updates & Diagnostics ", padding=10)
        maint_frame.pack(fill=tk.X, pady=(0, 10))

        m_grid = tk.Frame(maint_frame, bg="#111827")
        m_grid.pack(fill=tk.X)

        mb1 = ttk.Button(m_grid, text="Check OS Status", command=lambda: self.run_async("rpm-ostree status", "Querying rpm-ostree status..."))
        mb1.grid(row=0, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(mb1, "Displays currently active and staged rpm-ostree deployments.")

        mb2 = ttk.Button(m_grid, text="Update Flatpaks", command=lambda: self.run_async("flatpak update -y", "Updating Flatpak applications..."))
        mb2.grid(row=0, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(mb2, "Checks for and applies updates to all installed user Flatpaks.")

        mb3 = ttk.Button(m_grid, text="Validate Repo / Build", command=lambda: self.run_async("if command -v bobzzite-validate >/dev/null 2>&1; then bobzzite-validate; elif [ -f scripts/validate_build.py ]; then python3 scripts/validate_build.py; else echo 'Validation script not found'; fi", "Validating system & build readiness..."))
        mb3.grid(row=0, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb3, "Runs repository integrity, asset copy, and documentation checks.")

        mb_ci = ttk.Button(m_grid, text="Run CI Smoke Suite", command=lambda: self.run_async("if command -v bobzzite-ci >/dev/null 2>&1; then bobzzite-ci; elif [ -f scripts/bobzzite-ci.sh ]; then ./scripts/bobzzite-ci.sh; else echo 'CI runner script not found'; fi", "Executing Complete Local CI Smoke Test Pipeline..."))
        mb_ci.grid(row=2, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_ci, "Executes the full automated CI validation suite locally before pushing changes.")

        mb_webdash = ttk.Button(m_grid, text="Web Dashboard", command=lambda: self.run_async("if command -v bobzzite-webdash >/dev/null 2>&1; then bobzzite-webdash status; elif [ -f scripts/bobzzite-webdash.py ]; then python3 scripts/bobzzite-webdash.py status; else echo 'Webdash script not found'; fi", "Probing Remote Web Dashboard Server..."))
        mb_webdash.grid(row=2, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_webdash, "Inspects status of the lightweight remote web administration dashboard.")

        mb_sign = ttk.Button(m_grid, text="Verify Image Signatures", command=lambda: self.run_async("if command -v bobzzite-sign >/dev/null 2>&1; then bobzzite-sign check-keys; elif [ -f scripts/bobzzite-sign.sh ]; then ./scripts/bobzzite-sign.sh check-keys; else echo 'Sign script not found'; fi", "Auditing Cosign & Sigstore Cryptographic Signatures..."))
        mb_sign.grid(row=3, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_sign, "Verifies container image cryptographic signatures, Cosign public keys, and provenance.")

        mb_preview = ttk.Button(m_grid, text="Staging / PR Builds", command=lambda: self.run_async("if command -v bobzzite-preview >/dev/null 2>&1; then bobzzite-preview status; elif [ -f scripts/bobzzite-preview.sh ]; then ./scripts/bobzzite-preview.sh status; else echo 'Preview script not found'; fi", "Inspecting Ephemeral PR Preview Builds & Staging..."))
        mb_preview.grid(row=3, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_preview, "Manages ephemeral pull-request container image preview builds and staging tags.")

        mb_sec = ttk.Button(m_grid, text="Security Audit", command=lambda: self.run_async("if command -v bobzzite-security >/dev/null 2>&1; then bobzzite-security audit; elif [ -f scripts/bobzzite-security.sh ]; then ./scripts/bobzzite-security.sh audit; else echo 'Security script not found'; fi", "Auditing OS Immutability, SUID Binaries & Sandboxes..."))
        mb_sec.grid(row=4, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_sec, "Audits ostree filesystem immutability, elevated privilege binaries, and Flatpak isolation.")

        mb_prov = ttk.Button(m_grid, text="Supply-Chain Provenance", command=lambda: self.run_async("if command -v bobzzite-provenance >/dev/null 2>&1; then bobzzite-provenance status; elif [ -f scripts/bobzzite-provenance.sh ]; then ./scripts/bobzzite-provenance.sh status; else echo 'Provenance script not found'; fi", "Probing SLSA Provenance & SPDX SBOM Generator..."))
        mb_prov.grid(row=4, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_prov, "Generates and verifies SPDX Software Bill of Materials and in-toto SLSA attestations.")

        mb_ipfs = ttk.Button(m_grid, text="P2P / IPFS Package Mirror", command=lambda: self.run_async("if command -v bobzzite-ipfs >/dev/null 2>&1; then bobzzite-ipfs status; elif [ -f scripts/bobzzite-ipfs.sh ]; then ./scripts/bobzzite-ipfs.sh status; else echo 'IPFS script not found'; fi", "Probing Decentralized IPFS Package Mirror & Swarm Status..."))
        mb_ipfs.grid(row=5, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_ipfs, "Inspects IPFS daemon, swarm peers, and content-addressed package distribution.")

        mb_sb = ttk.Button(m_grid, text="Rootless Sandbox", command=lambda: self.run_async("if command -v bobzzite-sandbox >/dev/null 2>&1; then bobzzite-sandbox status; elif [ -f scripts/bobzzite-sandbox.sh ]; then ./scripts/bobzzite-sandbox.sh status; else echo 'Sandbox script not found'; fi", "Probing Unprivileged User Namespaces & Rootless Podman..."))
        mb_sb.grid(row=5, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_sb, "Spawns isolated, unprivileged rootless Podman sandboxes with memory and CPU cgroups constraints.")

        mb_bgate = ttk.Button(m_grid, text="Benchmark Gatekeeper", command=lambda: self.run_async("if command -v bobzzite-bench-gate >/dev/null 2>&1; then bobzzite-bench-gate check; elif [ -f scripts/bobzzite-bench-gate.sh ]; then ./scripts/bobzzite-bench-gate.sh check; else echo 'Bench gate script not found'; fi", "Executing CI Performance Regression Gate Check..."))
        mb_bgate.grid(row=6, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_bgate, "Runs reproducible hashing and compute benchmark, verifying performance against baseline SLA.")

        mb_lock = ttk.Button(m_grid, text="Kernel Lockdown & Security", command=lambda: self.run_async("if command -v bobzzite-lockdown >/dev/null 2>&1; then bobzzite-lockdown audit; elif [ -f scripts/bobzzite-lockdown.sh ]; then ./scripts/bobzzite-lockdown.sh audit; else echo 'Lockdown script not found'; fi", "Auditing EFI Secure Boot, Kernel Lockdown & IOMMU..."))
        mb_lock.grid(row=6, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_lock, "Audits EFI Secure Boot status, kernel lockdown modes, and IOMMU DMA protections.")

        mb_ebpf = ttk.Button(m_grid, text="eBPF Network Optimizer", command=lambda: self.run_async("if command -v bobzzite-ebpf >/dev/null 2>&1; then bobzzite-ebpf status; elif [ -f scripts/bobzzite-ebpf.sh ]; then ./scripts/bobzzite-ebpf.sh status; else echo 'eBPF script not found'; fi", "Probing eBPF/XDP Fastpath Packet Optimization..."))
        mb_ebpf.grid(row=7, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_ebpf, "Manages XDP fastpath packet acceleration for low-latency multiplayer gaming and game streaming.")

        mb_ucode = ttk.Button(m_grid, text="CPU Microcode & Mitigations", command=lambda: self.run_async("if command -v bobzzite-microcode >/dev/null 2>&1; then bobzzite-microcode audit; elif [ -f scripts/bobzzite-microcode.sh ]; then ./scripts/bobzzite-microcode.sh audit; else echo 'Microcode script not found'; fi", "Auditing CPU Microcode & Hardware Vulnerability Mitigations..."))
        mb_ucode.grid(row=7, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb_ucode, "Inspects active processor microcode level, early initramfs loading, and sysfs CPU vulnerability mitigations.")

        m_grid.columnconfigure(0, weight=1)
        m_grid.columnconfigure(1, weight=1)
        m_grid.columnconfigure(2, weight=1)

        # Section 3: Hardware & Handheld Management
        hw_frame = ttk.LabelFrame(container, text=" 🎮 Hardware & Gaming Profiles ", padding=10)
        hw_frame.pack(fill=tk.X, pady=(0, 10))

        hw_grid = tk.Frame(hw_frame, bg="#111827")
        hw_grid.pack(fill=tk.X)

        h1 = ttk.Button(hw_grid, text="Fastfetch Info", command=lambda: self.run_async("fastfetch", "Executing Fastfetch..."))
        h1.grid(row=0, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h1, "Runs terminal system hardware probe and prints system summary.")

        h2 = ttk.Button(hw_grid, text="GameMode Status", command=lambda: self.run_async("gamemoded -s", "Checking Feral GameMode status..."))
        h2.grid(row=0, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h2, "Queries whether GameMode governor optimization is currently active.")

        h_bench = ttk.Button(hw_grid, text="Run Benchmark", command=lambda: self.run_async("bobzzite-bench", "Executing system hardware & I/O benchmark..."))
        h_bench.grid(row=3, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_bench, "Measures CPU compute, storage I/O throughput, governor state, and GPU Vulkan capabilities.")

        h_audio = ttk.Button(hw_grid, text="Audio & PipeWire", command=lambda: self.run_async("bobzzite-audio status", "Inspecting PipeWire audio server & latency..."))
        h_audio.grid(row=3, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_audio, "Inspects PipeWire audio server status, active sound cards, and audio latency quantum.")

        h6 = ttk.Button(hw_grid, text="System Tuning", command=lambda: self.run_async("bobzzite-tweak status", "Inspecting system performance tunables..."))
        h6.grid(row=2, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h6, "Queries low-latency sysctl parameters, split lock mitigation, and PipeWire latency.")

        h7 = ttk.Button(hw_grid, text="Game Controllers", command=lambda: self.run_async("bobzzite-gamepad list", "Detecting connected controllers & joysticks..."))
        h7.grid(row=2, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h7, "Detects connected gamepads, tests axes/buttons, and configures handheld mapping.")

        h4 = ttk.Button(hw_grid, text="Dev Containers", command=lambda: self.run_async("bobzzite-devbox list", "Listing Distrobox dev environments..."))
        h4.grid(row=1, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h4, "Queries available Arch/Ubuntu Distrobox development containers.")

        h5 = ttk.Button(hw_grid, text="Mesh / P2P Status", command=lambda: self.run_async("bobzzite-mesh status", "Querying P2P mesh & sync status..."))
        h5.grid(row=1, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h5, "Queries status of Tailscale mesh networking and Syncthing P2P syncing.")

        h_flavors = ttk.Button(hw_grid, text="Hardware Flavors", command=lambda: self.run_async("if command -v bobzzite-build-flavors >/dev/null 2>&1; then bobzzite-build-flavors all inspect; elif [ -f scripts/build-flavors.sh ]; then ./scripts/build-flavors.sh all inspect; else echo 'Build flavors script not found'; fi", "Inspecting Hardware Flavor Profiles & Acceleration..."))
        h_flavors.grid(row=4, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_flavors, "Inspects hardware profiles, base image URIs, compositors, and GPU acceleration.")

        h_compare = ttk.Button(hw_grid, text="Compare Profiles", command=lambda: self.run_async("if command -v bobzzite-build-flavors >/dev/null 2>&1; then bobzzite-build-flavors all compare; elif [ -f scripts/build-flavors.sh ]; then ./scripts/build-flavors.sh all compare; else echo 'Build flavors script not found'; fi", "Generating Side-by-Side Hardware Comparison Matrix..."))
        h_compare.grid(row=4, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_compare, "Compares compositors, display leasing, audio buffers, and drivers across flavors side-by-side.")

        h_stream = ttk.Button(hw_grid, text="Game Streaming", command=lambda: self.run_async("bobzzite-stream status", "Inspecting Sunshine streaming host & video encoders..."))
        h_stream.grid(row=5, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_stream, "Manages Sunshine game streaming host and Moonlight client pairing for remote playtests.")

        h_webrtc = ttk.Button(hw_grid, text="WebRTC Stream", command=lambda: self.run_async("if command -v bobzzite-webrtc >/dev/null 2>&1; then bobzzite-webrtc status; elif [ -f scripts/bobzzite-webrtc.sh ]; then ./scripts/bobzzite-webrtc.sh status; else echo 'WebRTC script not found'; fi", "Inspecting WebRTC browser playtest streaming gateway..."))
        h_webrtc.grid(row=5, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_webrtc, "Probes WebRTC browser streaming gateway ports and hardware video encoder acceleration.")

        h_client = ttk.Button(hw_grid, text="Generate WebRTC Client", command=lambda: self.run_async("if command -v bobzzite-webrtc >/dev/null 2>&1; then bobzzite-webrtc generate-client; elif [ -f scripts/bobzzite-webrtc.sh ]; then ./scripts/bobzzite-webrtc.sh generate-client; else echo 'WebRTC script not found'; fi", "Generating zero-dependency HTML5 WebRTC client..."))
        h_client.grid(row=10, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_client, "Creates a zero-install HTML5/JS WebRTC playtest client page with gamepad support.")

        h_quirks = ttk.Button(hw_grid, text="Hardware Quirks", command=lambda: self.run_async("if command -v bobzzite-quirks >/dev/null 2>&1; then bobzzite-quirks probe; elif [ -f scripts/bobzzite-quirks.sh ]; then ./scripts/bobzzite-quirks.sh probe; else echo 'Quirks script not found'; fi", "Probing hardware device quirks and mitigations..."))
        h_quirks.grid(row=10, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_quirks, "Detects device-specific hardware quirks (Steam Deck, Ally, Legion Go) and applies fixes.")

        h_vr = ttk.Button(hw_grid, text="VR & OpenXR", command=lambda: self.run_async("bobzzite-vr status", "Probing VR headsets, DRM leasing & OpenXR runtimes..."))
        h_vr.grid(row=6, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_vr, "Checks connected VR headsets, Wayland DRM display leasing, and OpenXR runtime configuration.")

        h_eye = ttk.Button(hw_grid, text="XR Eye Tracking", command=lambda: self.run_async("if command -v bobzzite-eye-track >/dev/null 2>&1; then bobzzite-eye-track status; elif [ -f scripts/bobzzite-eye-track.sh ]; then ./scripts/bobzzite-eye-track.sh status; else echo 'Eye track script not found'; fi", "Probing XR Eye-Tracking Extensions & Calibration..."))
        h_eye.grid(row=6, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_eye, "Manages OpenXR eye-tracking extensions, 5-point calibration matrix, and dynamic foveated rendering.")

        h_iso = ttk.Button(hw_grid, text="Generate ISO", command=lambda: self.run_async("bobzzite-iso bobzzite", "Generating bootable installer media scripts..."))
        h_iso.grid(row=7, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_iso, "Configures and generates bootable installation ISOs using the Universal Blue isogenerator.")

        h_audit = ttk.Button(hw_grid, text="Hardware Audit", command=lambda: self.run_async("bobzzite-hardware-audit", "Auditing hardware compliance across flavor requirements..."))
        h_audit.grid(row=7, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_audit, "Audits CPU, GPU rendering, PipeWire audio, and controller compliance for Bobzzite OS.")

        h_deploy = ttk.Button(hw_grid, text="Deploy & Rebase", command=lambda: self.run_async("bobzzite-deploy detect", "Probing hardware signatures & recommended flavor..."))
        h_deploy.grid(row=8, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_deploy, "Detects hardware signatures (Steam Deck, NVIDIA, AMD) and displays recommended rebase target.")

        h_dep_insp = ttk.Button(hw_grid, text="Inspect Target Profile", command=lambda: self.run_async("bobzzite-deploy profile-inspect bobzzite-deck", "Inspecting Steam Deck target profile..."))
        h_dep_insp.grid(row=8, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_dep_insp, "Inspects hardware profile JSON specifications via bobzzite-deploy.")

        h_hdr = ttk.Button(hw_grid, text="HDR & Color Management", command=lambda: self.run_async("if command -v bobzzite-hdr >/dev/null 2>&1; then bobzzite-hdr status; elif [ -f scripts/bobzzite-hdr.sh ]; then ./scripts/bobzzite-hdr.sh status; else echo 'HDR script not found'; fi", "Probing Wayland Color Management & HDR Tone-Mapping..."))
        h_hdr.grid(row=17, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(h_hdr, "Calibrates Wayland xx-color-management-v4, BT.2020 WCG, and Gamescope HDR luminance.")

        h_dep_audit = ttk.Button(hw_grid, text="Deploy Compliance Audit", command=lambda: self.run_async("bobzzite-deploy profile-audit", "Running Deployment Hardware Compliance Audit..."))
        h_dep_audit.grid(row=16, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_dep_audit, "Validates hardware compliance and profile assertions before atomic rebasing.")

        h_dep_runbook = ttk.Button(hw_grid, text="Deployment Runbooks", command=lambda: self.run_async("cat docs/HARDWARE_DEPLOYMENT_WORKFLOWS.md | head -n 30", "Displaying Hardware Deployment Runbooks..."))
        h_dep_runbook.grid(row=16, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_dep_runbook, "Inspects operational runbooks for handheld, workstation, and air-gapped rebasing.")

        h_bat = ttk.Button(hw_grid, text="Battery Health & Charging", command=lambda: self.run_async("if command -v bobzzite-battery >/dev/null 2>&1; then bobzzite-battery health; elif [ -f scripts/bobzzite-battery.sh ]; then ./scripts/bobzzite-battery.sh health; else echo 'Battery script not found'; fi", "Auditing Battery Cell Health & Setting Charge Thresholds..."))
        h_bat.grid(row=18, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(h_bat, "Audits cycle degradation and sets 80% charge threshold to maximize handheld battery life.")

        h_val_prof = ttk.Button(hw_grid, text="Validate Profiles", command=lambda: self.run_async("if command -v bobzzite-profile-validate >/dev/null 2>&1; then bobzzite-profile-validate all; elif [ -f scripts/bobzzite-profile-validate.sh ]; then ./scripts/bobzzite-profile-validate.sh all; else echo 'Profile validate script not found'; fi", "Auditing Hardware JSON Profiles & Assertions..."))
        h_val_prof.grid(row=9, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_val_prof, "Verifies that all target flavor profiles satisfy compositor, driver, and audio buffer constraints.")

        h_prof_an = ttk.Button(hw_grid, text="Profile Analysis", command=lambda: self.run_async("bobzzite-deploy profile-analyze", "Analyzing host hardware fit against target flavor profiles..."))
        h_prof_an.grid(row=9, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_prof_an, "Calculates fit percentage and flavor migration recommendations for this physical machine.")

        h_compat = ttk.Button(hw_grid, text="Hardware Compatibility", command=lambda: self.run_async("if command -v bobzzite-compat >/dev/null 2>&1; then bobzzite-compat check; elif [ -f scripts/bobzzite-compat.sh ]; then ./scripts/bobzzite-compat.sh check; else echo 'Compat script not found'; fi", "Auditing broad hardware compatibility tier & instructions..."))
        h_compat.grid(row=11, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_compat, "Audits CPU instruction sets (AVX2), GPU backends, and assigns compatibility tier.")

        h_multi_arch = ttk.Button(hw_grid, text="Multi-Arch Targets", command=lambda: self.run_async("if command -v bobzzite-build-flavors >/dev/null 2>&1; then bobzzite-build-flavors all multi-arch; elif [ -f scripts/build-flavors.sh ]; then ./scripts/build-flavors.sh all multi-arch; else echo 'Build flavors script not found'; fi", "Querying multi-architecture build targets (x86_64, aarch64)..."))
        h_multi_arch.grid(row=11, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_multi_arch, "Displays multi-architecture compilation targets for x86_64 and ARM64 SBCs/laptops.")

        h_catalog = ttk.Button(hw_grid, text="Hardware Profiles Catalog", command=lambda: self.run_async("ls -la hardware_profiles/", "Listing version-controlled hardware profile JSON catalog..."))
        h_catalog.grid(row=12, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_catalog, "Inspects the repository-tracked hardware profiles directory (hardware_profiles/).")

        h_cov = ttk.Button(hw_grid, text="Hardware Coverage Audit", command=lambda: self.run_async("if command -v bobzzite-coverage >/dev/null 2>&1; then bobzzite-coverage audit; elif [ -f scripts/bobzzite-coverage.sh ]; then ./scripts/bobzzite-coverage.sh audit; else echo 'Coverage script not found'; fi", "Auditing Hardware Matrix Coverage Completeness..."))
        h_cov.grid(row=12, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_cov, "Asserts end-to-end coverage across specifications, images, and documentation for all flavors.")

        h_telem = ttk.Button(hw_grid, text="Live Telemetry", command=lambda: self.run_async("cat /proc/loadavg && cat /proc/meminfo | head -n4", "Probing live system compute and memory load..."))
        h_telem.grid(row=19, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(h_telem, "Inspects real-time CPU load averages and memory utilization telemetry.")

        h_rt = ttk.Button(hw_grid, text="Vulkan Ray Tracing", command=lambda: self.run_async("if command -v bobzzite-raytracing >/dev/null 2>&1; then bobzzite-raytracing audit; elif [ -f scripts/bobzzite-raytracing.sh ]; then ./scripts/bobzzite-raytracing.sh audit; else echo 'Raytracing script not found'; fi", "Auditing Vulkan KHR Hardware Ray Tracing Pipeline..."))
        h_rt.grid(row=20, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(h_rt, "Audits GPU hardware ray tracing extensions (VK_KHR_ray_tracing_pipeline, acceleration structures) and RADV/NV drivers.")

        h_fan = ttk.Button(hw_grid, text="Fan Curves & Thermals", command=lambda: self.run_async("if command -v bobzzite-fan >/dev/null 2>&1; then bobzzite-fan audit; elif [ -f scripts/bobzzite-fan.sh ]; then ./scripts/bobzzite-fan.sh audit; else echo 'Fan script not found'; fi", "Auditing Adaptive Thermal Fan Curves & Sensors..."))
        h_fan.grid(row=21, column=0, columnspan=2, padx=6, pady=4, sticky="ew")
        ToolTip(h_fan, "Audits hwmon thermal inputs, cooling devices, and configures acoustic fan profiles (quiet/balanced/perf).")

        h_summary = ttk.Button(hw_grid, text="Hardware Profile Summary", command=lambda: self.run_async("if command -v bobzzite-summary >/dev/null 2>&1; then bobzzite-summary terminal; elif [ -f scripts/bobzzite-summary.sh ]; then ./scripts/bobzzite-summary.sh terminal; else echo 'Summary script not found'; fi", "Generating Comprehensive Hardware Profile Summary Matrix..."))
        h_summary.grid(row=13, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_summary, "Generates an aggregated hardware profile summary matrix directly from hardware_profiles/.")

        h_report = ttk.Button(hw_grid, text="Hardware Compatibility Report", command=lambda: self.run_async("if command -v bobzzite-report >/dev/null 2>&1; then bobzzite-report summary; elif [ -f scripts/bobzzite-report.sh ]; then ./scripts/bobzzite-report.sh summary; else echo 'Report script not found'; fi", "Compiling Comprehensive Host Hardware Diagnostic Report..."))
        h_report.grid(row=13, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_report, "Aggregates hardware probing, compatibility tiers, audio buffers, and exportable Markdown report.")

        h_net = ttk.Button(hw_grid, text="Network I/O Telemetry", command=lambda: self.run_async("cat /proc/net/dev | head -n4", "Probing network streaming interface bandwidth..."))
        h_net.grid(row=14, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_net, "Inspects real-time RX/TX network byte counters and streaming bitrate deltas.")

        h_diff = ttk.Button(hw_grid, text="Profile Diff Analyzer", command=lambda: self.run_async("if command -v bobzzite-diff >/dev/null 2>&1; then bobzzite-diff bobzzite bobzzite-deck terminal; elif [ -f scripts/bobzzite-diff.sh ]; then ./scripts/bobzzite-diff.sh bobzzite bobzzite-deck terminal; else echo 'Diff script not found'; fi", "Analyzing Profile Divergences (bobzzite vs bobzzite-deck)..."))
        h_diff.grid(row=14, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_diff, "Compares architectural attributes and drivers between hardware profiles.")

        h_mig = ttk.Button(hw_grid, text="Hardware Migration Assistant", command=lambda: self.run_async("if command -v bobzzite-migrate >/dev/null 2>&1; then bobzzite-migrate bobzzite-deck --dry-run; elif [ -f scripts/bobzzite-migrate.sh ]; then ./scripts/bobzzite-migrate.sh bobzzite-deck --dry-run; else echo 'Migrate script not found'; fi", "Executing Hardware Migration Pre-Flight Check..."))
        h_mig.grid(row=15, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h_mig, "Conducts pre-flight compatibility checks, profile diff, snapshot backups, and atomic rebase assistance.")

        h_metrics = ttk.Button(hw_grid, text="Prometheus Metrics Gateway", command=lambda: self.run_async("if command -v bobzzite-metrics >/dev/null 2>&1; then bobzzite-metrics status; elif [ -f scripts/bobzzite-metrics.sh ]; then ./scripts/bobzzite-metrics.sh status; else echo 'Metrics script not found'; fi", "Inspecting Prometheus Hardware Metrics Exposition..."))
        h_metrics.grid(row=15, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h_metrics, "Exposes hardware metrics (CPU load, thermal zones, memory, flavor) in standard Prometheus format.")

        mb4 = ttk.Button(m_grid, text="System Doctor", command=lambda: self.run_async("bobzzite-doctor", "Running complete system diagnostics..."))
        mb4.grid(row=1, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(mb4, "Performs health checks on atomic OS, GPU drivers, GameMode, and dev tool Flatpaks.")

        mb5 = ttk.Button(m_grid, text="Backup / Snapshots", command=lambda: self.run_async("bobzzite-backup status", "Checking backup snapshots..."))
        mb5.grid(row=1, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(mb5, "Inspects pinned ostree deployments and saved user dev snapshots.")

        mb6 = ttk.Button(m_grid, text="Purge System Caches", command=lambda: self.run_async("bobzzite-clean", "Purging temporary caches and unused Flatpaks..."))
        mb6.grid(row=1, column=2, padx=6, pady=4, sticky="ew")
        ToolTip(mb6, "Safely removes unused Flatpak runtimes, package caches, and temporary files.")

        h3 = ttk.Button(hw_grid, text="Quit Servers / Exit", style="Danger.TButton", command=self.quit_app)
        h3.grid(row=0, column=2, rowspan=22, padx=6, pady=4, sticky="nsew")
        ToolTip(h3, "Safely closes background processes and exits the Bobzzite Control Center.")

        hw_grid.columnconfigure(0, weight=1)
        hw_grid.columnconfigure(1, weight=1)
        hw_grid.columnconfigure(2, weight=1)

    def _build_log_console(self):
        log_frame = ttk.LabelFrame(self.root, text=" 📜 Terminal Output & Status Logs ", padding=8)
        log_frame.pack(fill=tk.BOTH, expand=True, padx=12, pady=(0, 10))

        self.log_area = scrolledtext.ScrolledText(
            log_frame,
            wrap=tk.WORD,
            bg="#0f172a",
            fg="#38bdf8",
            insertbackground="#ffffff",
            font=("Consolas", 9),
            height=10
        )
        self.log_area.pack(fill=tk.BOTH, expand=True)
        self.log("Welcome to bobzzite Control Center. Ready for autonomous operations.\n")

    def _build_status_bar(self):
        status_bar = tk.Frame(self.root, bg="#111827", padx=8, pady=4)
        status_bar.pack(fill=tk.X, side=tk.BOTTOM)

        self.status_label = tk.Label(status_bar, text="Status: Ready", bg="#111827", fg="#10b981", font=("Segoe UI", 9))
        self.status_label.pack(side=tk.LEFT)

        ver_str = "1.0.0"
        if os.path.exists("/etc/bobzzite-release"):
            try:
                with open("/etc/bobzzite-release") as f:
                    for line in f:
                        if line.startswith("VERSION="):
                            ver_str = line.strip().split("=")[1].strip('"\'')
            except Exception:
                pass
        version_label = tk.Label(status_bar, text=f"bobzzite v{ver_str}", bg="#111827", fg="#64748b", font=("Segoe UI", 9))
        version_label.pack(side=tk.RIGHT)

    def log(self, message):
        self.log_area.insert(tk.END, message + "\n")
        self.log_area.see(tk.END)

    def set_status(self, text, color="#10b981"):
        self.status_label.config(text=f"Status: {text}", fg=color)

    def run_async(self, cmd, desc):
        self.log(f">> {desc}")
        self.set_status("Running...", "#38bdf8")

        def worker():
            try:
                proc = subprocess.Popen(
                    cmd,
                    shell=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT,
                    text=True
                )
                for line in proc.stdout:
                    self.root.after(0, self.log, line.rstrip())
                proc.wait()
                if proc.returncode == 0:
                    self.root.after(0, self.set_status, "Completed successfully", "#10b981")
                else:
                    self.root.after(0, self.set_status, f"Exited with code {proc.returncode}", "#ef4444")
            except Exception as e:
                self.root.after(0, self.log, f"Error: {e}")
                self.root.after(0, self.set_status, "Execution Failed", "#ef4444")

        thread = threading.Thread(target=worker, daemon=True)
        thread.start()

    def quit_app(self):
        self.log("Shutting down bobzzite Control Center...")
        self.root.destroy()


def main():
    root = tk.Tk()
    app = BobzziteControlCenter(root)
    root.mainloop()


if __name__ == "__main__":
    main()
