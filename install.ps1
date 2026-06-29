# © 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved.
# install.ps1 — install VGX Claude Code skills into ~/.claude/skills/

$SkillsSrc = Join-Path $PSScriptRoot "skills"
$SkillsDest = Join-Path $env:USERPROFILE ".claude\skills"

Write-Host "VGX Claude Masterclass — Skill Installer"
Write-Host "Installing from: $SkillsSrc"
Write-Host "Installing to:   $SkillsDest"
Write-Host ""

New-Item -ItemType Directory -Force -Path $SkillsDest | Out-Null

$installed = 0
foreach ($skillDir in Get-ChildItem -Path $SkillsSrc -Directory) {
    $dest = Join-Path $SkillsDest $skillDir.Name
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item -Path (Join-Path $skillDir.FullName "SKILL.md") -Destination $dest -Force
    Write-Host "  + $($skillDir.Name)"
    $installed++
}

Write-Host ""
Write-Host "Done. $installed skill(s) installed."
Write-Host "Restart Claude Code (or reload the window) to activate."
