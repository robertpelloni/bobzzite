#!/usr/bin/env python3
"""
Bobzzite System Tray Monitor
Provides an unobtrusive desktop tray applet to view system status,
launch the Bobzzite Control Center, and safely terminate running background services.
"""

import os
import sys
import subprocess
import tkinter as tk
from tkinter import ttk, messagebox

class BobzziteTray:
    def __init__(self, root):
        self.root = root
        self.root.title("bobzzite Tray")
        self.root.geometry("260x180")
        self.root.resizable(False, False)
        self.root.configure(bg="#0b0f19")

        # Position in lower right corner by default
        screen_w = self.root.winfo_screenwidth()
        screen_h = self.root.winfo_screenheight()
        x = max(20, screen_w - 290)
        y = max(20, screen_h - 260)
        self.root.geometry(f"+{x}+{y}")

        self.root.attributes("-topmost", True)

        self._build_ui()

    def _build_ui(self):
        frame = tk.Frame(self.root, bg="#111827", padx=10, pady=10)
        frame.pack(fill=tk.BOTH, expand=True)

        header = tk.Label(
            frame,
            text="⚡ bobzzite Tray",
            font=("Segoe UI", 11, "bold"),
            bg="#111827",
            fg="#00d2ff"
        )
        header.pack(fill=tk.X, pady=(0, 8))

        btn_cc = tk.Button(
            frame,
            text="🖥️ Open Control Center",
            font=("Segoe UI", 9, "bold"),
            bg="#0284c7",
            fg="#ffffff",
            activebackground="#0369a1",
            relief=tk.FLAT,
            command=self.open_control_center
        )
        btn_cc.pack(fill=tk.X, pady=3)

        btn_diag = tk.Button(
            frame,
            text="🩺 Quick Diagnostics",
            font=("Segoe UI", 9),
            bg="#1e293b",
            fg="#f8fafc",
            activebackground="#334155",
            relief=tk.FLAT,
            command=self.open_doctor
        )
        btn_diag.pack(fill=tk.X, pady=3)

        btn_quit = tk.Button(
            frame,
            text="🛑 Quit Servers & Exit",
            font=("Segoe UI", 9),
            bg="#b91c1c",
            fg="#ffffff",
            activebackground="#991b1b",
            relief=tk.FLAT,
            command=self.quit_all
        )
        btn_quit.pack(fill=tk.X, pady=(3, 0))

    def open_control_center(self):
        subprocess.Popen("bobzzite-control-center", shell=True)

    def open_doctor(self):
        subprocess.Popen("bobzzite-doctor", shell=True)

    def quit_all(self):
        # Gracefully stop user-level syncthing and tray
        subprocess.run("systemctl --user stop syncthing 2>/dev/null || true", shell=True)
        self.root.destroy()

def main():
    root = tk.Tk()
    app = BobzziteTray(root)
    root.mainloop()

if __name__ == "__main__":
    main()
