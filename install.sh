#!/usr/bin/env bash
# (c) 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved.
# install.sh - install VGX Claude Code skills into ~/.claude/skills/
# Fetches each skill file directly from GitHub. No git binary or clone required.

set -euo pipefail
BASE="https://raw.githubusercontent.com/VGXDigital/vgx-skills/main/skills"
DEST="$HOME/.claude/skills"

echo "VGX Claude Masterclass - Skill Installer"
echo "Installing to: $DEST"
echo ""

mkdir -p "$DEST/vgx-pfix/references"
curl -fsSL "$BASE/vgx-pfix/SKILL.md" -o "$DEST/vgx-pfix/SKILL.md"
curl -fsSL "$BASE/vgx-pfix/references/formula.md" -o "$DEST/vgx-pfix/references/formula.md"
echo "  + vgx-pfix"

echo ""
echo "Done. 1 skill(s) installed."
echo "Restart Claude Code (or reload the window) to activate."
