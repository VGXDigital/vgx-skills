---
name: vgx-pfix
description: This skill should be used when the user asks to "fix my prompt", "check my prompt", "diagnose this prompt", "improve this prompt", "is this a good prompt", "pfix", or "/vgx-pfix". Diagnoses a developer prompt against the VGX 5-Part Formula, flags prompting traps, and rewrites the prompt to fix every issue found.
version: 1.0.0
---

<!-- © 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved. -->

# vgx-pfix — VGX Prompt Fix

Diagnose a developer prompt against the 5-Part Formula. Score each part, flag prompting traps, deliver a verdict, rewrite.

The goal is not to correct what the developer is building — it is to correct how they communicated it to Claude.

---

## Before Starting

Load `references/formula.md` before diagnosing any prompt. It contains the full 5-Part Formula table, 10 traps with descriptions, scoring definitions, verdict thresholds, and the analysis-task adaptation.

---

## Process

### Step 1 — Receive the prompt

Analyse immediately. Do not ask clarifying questions first.

If no prompt was supplied: output one sentence — "Paste the prompt you want diagnosed."

### Step 2 — Score each part

Assign PRESENT / WEAK / MISSING to each of the five parts. Use the scoring definitions in `references/formula.md`. Write one specific sentence explaining each score — not what the part is, but why this prompt's version of it is scored that way.

For analysis or audit prompts (no code generation involved), apply the analysis-task adaptation from `references/formula.md` when scoring Existing Code.

### Step 3 — Identify triggered traps

Check the prompt against all ten traps in `references/formula.md`. Flag every match. One line per trap: number, name, one sentence on why it applies.

### Step 4 — Output the diagnosis report

```
## Prompt Diagnosis

### Part Scores
- Context: [PRESENT | WEAK | MISSING] — [reason]
- Existing Code: [PRESENT | WEAK | MISSING] — [reason]
- Request: [PRESENT | WEAK | MISSING] — [reason]
- Constraints: [PRESENT | WEAK | MISSING] — [reason]
- Output Format: [PRESENT | WEAK | MISSING] — [reason]

### Traps Triggered
[trap number — trap name: one-line explanation]
[or: None detected]

### Verdict
[STRONG | NEEDS WORK | WEAK]
```

Use verdict thresholds from `references/formula.md`.

### Step 5 — Rewrite the prompt

Produce a fixed version that addresses every WEAK or MISSING part and neutralises every triggered trap.

Rewrite rules:
- Keep the developer's intent exactly — do not change what they are trying to build
- Use `[PLACEHOLDER]` only where the actual value is genuinely unknowable (e.g. file paths not provided)
- Do not pad — add only what was genuinely missing
- The rewrite must pass the 5-second check from `references/formula.md`

```
## Fixed Prompt

[rewritten prompt, ready to paste into Claude Code]

## What Changed
- [bullet per change: what was added or strengthened and why]
```

### Step 6 — Teaching note (conditional)

Add a teaching note only when the diagnosis reveals a clear repeating pattern — for example, Existing Code is always skipped, or Constraints are consistently absent. Two to three sentences maximum. Skip this step entirely if no pattern is visible.

---

## Output Rules

- Diagnose like a senior developer reviewing a junior's PR: direct, specific, not harsh
- Note PRESENT parts with their score and move on — no praise
- No padding, no pleasantries, no filler
- Fixed prompt must be immediately usable — minimal placeholders
- Never change what the developer is trying to build

---

## Additional Resources

### Reference Files

- **`references/formula.md`** — 5-Part Formula table, 5-second check, 10 traps with detail, scoring definitions, verdict thresholds, analysis-task adaptation
