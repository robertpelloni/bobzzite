# Bobzzite OS Game Localization & Internationalization (i18n) Guide

## Overview

Bobzzite OS provides automated internationalization and string table management tooling for indie game developers. Reaching international audiences on Steam, Itch.io, and handheld marketplaces requires robust localization pipelines for English, Spanish, French, German, Japanese, and other languages.

---

## The `bobzzite-i18n` Localization Tool

Manage and compile language tables using `bobzzite-i18n` or trigger it through the **Bobzzite Control Center**:

```bash
# 1. Scan project for translation tables and catalog status
bobzzite-i18n ~/Templates/Godot4_Starter status

# 2. Initialize starter multi-language CSV template
bobzzite-i18n ~/Templates/Godot4_Starter init-template

# 3. Compile GNU gettext .po files to binary .mo formats
bobzzite-i18n ~/Templates/Godot4_Starter compile
```

---

## Godot 4 Localization Workflow

1. **Creating the CSV Table:**
   - Define a CSV table with `keys` in column 0, followed by standard ISO 639-1 language codes (`en`, `es`, `fr`, `de`, `ja`).
2. **Ingesting into Godot:**
   - In Godot 4, open **Project Settings > Localization > Translations**.
   - Click **Add...** and select `translations.csv` (or `.po` gettext catalogs).
   - Godot automatically generates compiled `.translation` resources for each language.
3. **In-Game Dynamic Text Switching:**
   - Access translated strings in GDScript via:
     ```gdscript
     $Label.text = tr("MSG_WELCOME")
     TranslationServer.set_locale("ja")
     ```
