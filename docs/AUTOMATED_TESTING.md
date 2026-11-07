# Bobzzite OS Game Automated Testing & CI/CD Guide

## Overview

Bobzzite OS integrates headless test runners, script linters, and continuous integration workflows for indie game development in Godot 4.

Testing game logic headlessly enables catching broken scene UID references, unhandled null pointers, and script syntax errors before pushing code or releasing builds to Steam and itch.io.

---

## The `bobzzite-test` Game Test Runner

Run tests directly from the terminal or trigger them through the **Bobzzite Control Center**:

```bash
# 1. Run full project syntax and scene integrity check
bobzzite-test ~/Templates/Godot4_Starter syntax-check

# 2. Run GUT (Godot Unit Test) framework headlessly
bobzzite-test ~/Projects/MyGame gut

# 3. Validate scene resource hierarchy trees
bobzzite-test ~/Projects/MyGame scenes
```

---

## Integration with GitHub Actions CI

Game developers can automate unit testing in GitHub Actions using the Bobzzite base container image:

```yaml
name: Game CI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/robertpelloni/bobzzite:latest
    steps:
      - uses: actions/checkout@v4
      - name: Run Game Tests
        run: bobzzite-test . syntax-check
```
