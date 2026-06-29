#!/usr/bin/env bash
# © 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved.
# install.sh — install VGX Claude Code skills into ~/.claude/skills/

set -e

SKILLS_SRC="$(cd "$(dirname "$0")/skills" && pwd)"
SKILLS_DEST="$HOME/.claude/skills"

echo "VGX Claude Masterclass — Skill Installer"
echo "Installing from: $SKILLS_SRC"
echo "Installing to:   $SKILLS_DEST"
echo ""

mkdir -p "$SKILLS_DEST"

installed=0
for skill_dir in "$SKILLS_SRC"/*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$SKILLS_DEST/$skill_name"
  mkdir -p "$dest"
  cp "$skill_dir/SKILL.md" "$dest/SKILL.md"
  echo "  ✓ $skill_name"
  installed=$((installed + 1))
done

echo ""
echo "Done. $installed skill(s) installed."
echo "Restart Claude Code (or reload the window) to activate."
