# VGX Claude Masterclass — Skills

> © 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved.

Claude Code skills for the **AI-Powered Development with Claude** masterclass.

## Install

### Mac / Linux

```bash
git clone https://github.com/vgx-global/claude-masterclass-skills.git
cd claude-masterclass-skills
bash install.sh
```

### Windows (PowerShell)

```powershell
git clone https://github.com/vgx-global/claude-masterclass-skills.git
cd claude-masterclass-skills
.\install.ps1
```

After install: **restart Claude Code** (or reload the VS Code window with Claude Code extension).

## Skills included

| Skill | Trigger | What it does |
|---|---|---|
| `vgx-pfix` | `/vgx-pfix` or "fix my prompt" | Diagnoses a developer prompt against the 5-Part Formula. Scores each part, flags prompting traps, rewrites to fix issues. |

## Usage

In Claude Code, type `/vgx-pfix` then paste the prompt you want diagnosed. Or just say "fix my prompt" and paste it.

## Adding more skills

Drop a new `skills/<skill-name>/SKILL.md` into this repo and re-run the installer.
