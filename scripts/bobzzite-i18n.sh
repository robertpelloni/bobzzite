#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Indie Game Localization & Translation Utility
# ==============================================================================
# Automates extraction, compilation, and validation of Godot 4 localization
# tables (CSV, PO, and MO formats) for multi-language game releases.
# ==============================================================================

set -euo pipefail

TARGET_DIR="${1:-${HOME}/Templates/Godot4_Starter}"
ACTION="${2:-status}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Game Localization & i18n Manager ===${NC}\n"

if [ ! -d "${TARGET_DIR}" ]; then
    echo -e "${RED}Error: Project directory not found: ${TARGET_DIR}${NC}"
    echo -e "Usage: bobzzite-i18n [project_directory] [status|init-template|compile]"
    exit 1
fi

echo -e "${YELLOW}Target Project : ${CYAN}${TARGET_DIR}${NC}"
echo -e "${YELLOW}Action         : ${CYAN}${ACTION}${NC}\n"

case "${ACTION}" in
    status)
        echo -e "${YELLOW}Scanning Localization Tables & Language Catalogs:${NC}"
        CSV_COUNT=$(find "${TARGET_DIR}" -type f -iname "*translation*.csv" 2>/dev/null | wc -l)
        PO_COUNT=$(find "${TARGET_DIR}" -type f -iname "*.po" 2>/dev/null | wc -l)
        MO_COUNT=$(find "${TARGET_DIR}" -type f -iname "*.mo" 2>/dev/null | wc -l)

        echo -e "  • CSV Translation Tables : ${CYAN}${CSV_COUNT}${NC}"
        echo -e "  • GNU gettext .po Catalogs: ${CYAN}${PO_COUNT}${NC}"
        echo -e "  • Compiled .mo Binaries   : ${CYAN}${MO_COUNT}${NC}"

        if [ -f "${TARGET_DIR}/project.godot" ]; then
            echo -e "  • Godot Project File: ${GREEN}Present${NC}"
        fi
        ;;

    init-template)
        echo -e "${GREEN}Creating Starter Translation CSV in ${TARGET_DIR}...${NC}"
        mkdir -p "${TARGET_DIR}/localization"
        cat << 'EOF' > "${TARGET_DIR}/localization/translations.csv"
keys,en,es,fr,de,ja
MSG_START,Start Game,Iniciar Juego,Démarrer le Jeu,Spiel Starten,ゲーム開始
MSG_OPTIONS,Options,Opciones,Options,Optionen,設定
MSG_QUIT,Quit,Salir,Quitter,Beenden,終了
MSG_WELCOME,Welcome to Bobzzite OS!,¡Bienvenido a Bobzzite OS!,Bienvenue sur Bobzzite OS!,Willkommen bei Bobzzite OS!,Bobzzite OSへようこそ！
EOF
        echo -e "${BOLD}${GREEN}✔ Created translation template at ${TARGET_DIR}/localization/translations.csv${NC}"
        ;;

    compile)
        echo -e "${GREEN}Compiling gettext .po catalogs to .mo binaries...${NC}"
        if command -v msgfmt >/dev/null 2>&1; then
            find "${TARGET_DIR}" -type f -iname "*.po" | while read -r po; do
                mo="${po%.po}.mo"
                echo -e "  • Compiling: $(basename "$po") -> $(basename "$mo")"
                msgfmt -o "$mo" "$po"
            done
            echo -e "${BOLD}${GREEN}✔ Translation catalogs compiled.${NC}"
        else
            echo -e "${YELLOW}Notice: 'msgfmt' (gettext) not installed. Native Godot CSV importing is recommended for direct engine ingestion.${NC}"
        fi
        ;;

    *)
        echo "Usage: bobzzite-i18n [project_directory] [status|init-template|compile]"
        exit 1
        ;;
esac
