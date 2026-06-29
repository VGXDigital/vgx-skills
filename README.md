# VGX Skills

> © 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved.

Claude Code skills by VGX Global Consulting. Install once, use across every project.

---

## Install

### Mac / Linux

```bash
git clone https://github.com/VGXDigital/vgx-skills.git
cd vgx-skills
bash install.sh
```

### Windows (PowerShell)

```powershell
git clone https://github.com/VGXDigital/vgx-skills.git
cd vgx-skills
.\install.ps1
```

Restart Claude Code after install (or reload the VS Code window).

---

## Updating

Pull latest and re-run the installer:

```bash
# Mac / Linux
git pull && bash install.sh


# Windows
git pull; .\install.ps1
```

The installer overwrites existing skills — safe to run repeatedly.

---

## Skills

| Skill | Invoke | What it does |
|---|---|---|
| `vgx-pfix` | `/vgx-pfix` or *"fix my prompt"* | Diagnoses a developer prompt against the 5-Part Formula. Scores each part (Context, Existing Code, Request, Constraints, Output Format), flags the 10 prompting traps, gives a verdict, and rewrites the prompt to fix every issue. |

---

## How it works

Skills install to `~/.claude/skills/` on Mac/Linux and `%USERPROFILE%\.claude\skills\` on Windows. Claude Code picks them up automatically — no config needed.

Each skill is a single `SKILL.md` file. To inspect what a skill does before running it:

```
~/.claude/skills/vgx-pfix/SKILL.md
```

---

## For course instructors

This repo is the distribution point for VGX masterclass skills. To add a new skill:

1. Create `skills/<skill-name>/SKILL.md`
2. Add a row to the Skills table above
3. Commit and push — participants re-run the installer to get it

Skills are scoped to the user's machine (global install), so they work in any project the participant opens in Claude Code.
