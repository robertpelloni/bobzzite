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

        h4 = ttk.Button(hw_grid, text="Dev Containers", command=lambda: self.run_async("bobzzite-devbox list", "Listing Distrobox dev environments..."))
        h4.grid(row=1, column=0, padx=6, pady=4, sticky="ew")
        ToolTip(h4, "Queries available Arch/Ubuntu Distrobox development containers.")

        h5 = ttk.Button(hw_grid, text="Mesh / P2P Status", command=lambda: self.run_async("bobzzite-mesh status", "Querying P2P mesh & sync status..."))
        h5.grid(row=1, column=1, padx=6, pady=4, sticky="ew")
        ToolTip(h5, "Queries status of Tailscale mesh networking and Syncthing P2P syncing.")

        mb4 = ttk.Button(m_grid, text="System Doctor", command=lambda: self.run_async("bobzzite-doctor", "Running complete system diagnostics..."))
        mb4.grid(row=1, column=0, columnspan=3, padx=6, pady=4, sticky="ew")
        ToolTip(mb4, "Performs health checks on atomic OS, GPU drivers, GameMode, and dev tool Flatpaks.")

        h3 = ttk.Button(hw_grid, text="Quit Servers / Exit", style="Danger.TButton", command=self.quit_app)
        h3.grid(row=0, column=2, rowspan=2, padx=6, pady=4, sticky="nsew")
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
