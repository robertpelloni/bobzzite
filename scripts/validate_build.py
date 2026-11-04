#!/usr/bin/env python3
"""Build validation tool for bobzzite repository."""

import os
import sys
import re

def check_containerfile_copies():
    containerfile = "Containerfile"
    if not os.path.exists(containerfile):
        print(f"FAIL: {containerfile} not found")
        return False

    with open(containerfile, "r") as f:
        content = f.readlines()

    errors = 0
    for idx, line in enumerate(content, 1):
        line = line.strip()
        if line.startswith("COPY"):
            parts = line.split()
            if len(parts) >= 3:
                src = parts[1]
                # Strip any quotes or trailing slashes
                clean_src = src.strip('"\'').rstrip("/")
                if not os.path.exists(clean_src):
                    print(f"FAIL: {containerfile}:{idx} COPY source does not exist: {src}")
                    errors += 1
                else:
                    print(f"PASS: COPY source exists: {src}")

    return errors == 0

def check_scripts():
    scripts_to_check = [
        "config/scripts/build.sh",
        "scripts/post-install.sh"
    ]
    errors = 0
    for script in scripts_to_check:
        if not os.path.exists(script):
            print(f"FAIL: Script not found: {script}")
            errors += 1
            continue

        if not os.access(script, os.X_OK):
            print(f"FAIL: Script is not executable: {script}")
            errors += 1
            continue

        with open(script, "r") as f:
            first_line = f.readline().strip()
            if not first_line.startswith("#!"):
                print(f"FAIL: Script missing shebang: {script}")
                errors += 1
                continue

        print(f"PASS: Script valid and executable: {script}")

    return errors == 0

def check_required_docs():
    required_docs = [
        "VERSION.md",
        "ROADMAP.md",
        "TODO.md",
        "VISION.md",
        "MEMORY.md",
        "DEPLOY.md",
        "IDEAS.md",
        "CHANGELOG.md",
        "HANDOFF.md",
        "README.md",
        "AGENTS.md"
    ]
    errors = 0
    for doc in required_docs:
        if not os.path.isfile(doc):
            print(f"FAIL: Missing required doc: {doc}")
            errors += 1
        else:
            size = os.path.getsize(doc)
            if size == 0:
                print(f"FAIL: Doc is empty: {doc}")
                errors += 1
            else:
                print(f"PASS: Doc exists ({size} bytes): {doc}")

    return errors == 0

def main():
    print("=== Running bobzzite Build Validation ===")
    cf_ok = check_containerfile_copies()
    scripts_ok = check_scripts()
    docs_ok = check_required_docs()

    if cf_ok and scripts_ok and docs_ok:
        print("\n=== ALL BUILD VALIDATION CHECKS PASSED ===")
        sys.exit(0)
    else:
        print("\n=== BUILD VALIDATION FAILED ===")
        sys.exit(1)

if __name__ == "__main__":
    main()
