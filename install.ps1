# (c) 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved.
# install.ps1 - install VGX Claude Code skills into ~/.claude/skills/
# Fetches each skill file directly from GitHub. No git binary or clone required.

$ErrorActionPreference = "Stop"
$Base = "https://raw.githubusercontent.com/VGXDigital/vgx-skills/main/skills"
$Dest = Join-Path $env:USERPROFILE ".claude\skills"

Write-Host "VGX Claude Masterclass - Skill Installer"
Write-Host "Installing to: $Dest"
Write-Host ""

New-Item -ItemType Directory -Force -Path (Join-Path $Dest "vgx-pfix\references") | Out-Null
Invoke-WebRequest -Uri "$Base/vgx-pfix/SKILL.md" -OutFile (Join-Path $Dest "vgx-pfix\SKILL.md")
Invoke-WebRequest -Uri "$Base/vgx-pfix/references/formula.md" -OutFile (Join-Path $Dest "vgx-pfix\references\formula.md")
Write-Host "  + vgx-pfix"

Write-Host ""
Write-Host "Done. 1 skill(s) installed."
Write-Host "Restart Claude Code (or reload the window) to activate."
