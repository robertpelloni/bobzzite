#!/bin/bash
set -euo pipefail

# Godot 4 + VS Codium Integration Script for bobzzite
# Configures Flatpak environment settings for smooth GDScript language server communication
# and external editor integration between Godot and VS Codium.

echo "=== Configuring Godot 4 & VS Codium Integration ==="

TARGET_USER="${SUDO_USER:-$USER}"
USER_HOME=$(eval echo "~${TARGET_USER}")
CODIUM_CONFIG_DIR="${USER_HOME}/.var/app/com.vscodium.codium/config/VSCodium/User"
GODOT_CONFIG_DIR="${USER_HOME}/.config/godot"

echo "Configuring VS Codium settings for user '${TARGET_USER}' in ${CODIUM_CONFIG_DIR}..."
mkdir -p "${CODIUM_CONFIG_DIR}"
mkdir -p "${GODOT_CONFIG_DIR}"

SETTINGS_FILE="${CODIUM_CONFIG_DIR}/settings.json"

# Prepare JSON settings for Godot tools in VS Codium
if [ ! -f "${SETTINGS_FILE}" ] || [ ! -s "${SETTINGS_FILE}" ]; then
    cat << 'EOF' > "${SETTINGS_FILE}"
{
  "godotTools.lsp.serverHost": "127.0.0.1",
  "godotTools.lsp.serverPort": 6005,
  "godotTools.editorPath.godot4": "flatpak run org.godotengine.Godot",
  "editor.tabSize": 4,
  "editor.insertSpaces": false,
  "files.autoSave": "afterDelay"
}
EOF
else
    echo "Existing settings.json detected at ${SETTINGS_FILE}. Preserving user configuration."
fi

# Copy default Godot 4 editor settings with external editor configured if not already existing
GODOT_SETTINGS_DEST="${GODOT_CONFIG_DIR}/editor_settings-4.tres"
if [ ! -f "${GODOT_SETTINGS_DEST}" ] && [ -f "/etc/skel/.config/godot/editor_settings-4.tres" ]; then
    cp "/etc/skel/.config/godot/editor_settings-4.tres" "${GODOT_SETTINGS_DEST}"
    echo "Installed default Godot 4 editor settings pointing to VS Codium."
fi

# Ensure flatpak permissions allow socket/network communication between Godot and VSCodium
if command -v flatpak >/dev/null 2>&1; then
    echo "Overriding flatpak permissions for external editor invocation..."
    flatpak override --user --share=network com.vscodium.codium 2>/dev/null || true
    flatpak override --user --share=network org.godotengine.Godot 2>/dev/null || true

    # Attempt to install geequlim.godot-tools in VS Codium if flatpak run is possible
    echo "Checking for geequlim.godot-tools extension in VS Codium..."
    flatpak run com.vscodium.codium --install-extension geequlim.godot-tools 2>/dev/null || true
fi

echo "=== Godot 4 & VS Codium integration configuration complete ==="
