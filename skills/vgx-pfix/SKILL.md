---
name: vgx-pfix
description: VGX Prompt Fix — diagnose and fix a developer prompt against the 5-Part Formula (Context, Existing Code, Request, Constraints, Output Format). Flags missing or weak parts, rewrites the prompt. Use when asked to "fix my prompt", "pfix", "vgx-pfix", "diagnose this prompt", "improve this prompt", "check my prompt", or "/vgx-pfix".
triggers:
  - fix my prompt
  - pfix
  - vgx-pfix
  - diagnose this prompt
  - improve this prompt
  - check my prompt
  - review this prompt
  - is this a good prompt
---

<!-- © 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved. -->

# /vgx-pfix — VGX Prompt Fix

Diagnose a developer prompt against the 5-Part Formula. Score each part, flag prompting traps, verdict, rewrite.

**You are not correcting what the developer is building. You are correcting how they communicated it to Claude.**

---

## The 5-Part Formula

| Part | What it provides | Missing when... |
|---|---|---|
| **1. Context** | Project, stack, current state, what's NOT in scope | Claude produces generic code that doesn't fit the project |
| **2. Existing Code** | File or function Claude should match | Claude invents structure instead of matching what's there |
| **3. Request** | Specific thing to do, scoped and bounded | Claude over-builds, goes too broad, or misunderstands the task |
| **4. Constraints** | Library choices, naming, patterns, security rules, what NOT to change | Claude ignores conventions, uses wrong libraries, violates rules |
| **5. Output Format** | How the response should be shaped | Claude wraps code in explanation, returns whole file when you wanted a snippet |

**Key insight:** The Request is typically the *smallest* part. Context + Existing Code + Constraints do most of the work.

---

## The 5-Second Check

Run these before hitting enter on any prompt:

1. Does Claude know what project this is?
2. Did I show it a reference file?
3. Is my ask one specific, scoped thing?
4. Did I state rules that aren't obvious?
5. Did I say what I DON'T want?

---

## The Ten Prompting Traps

Flag by number and name when they apply.

1. **No Existing Code** — asking for new code without showing existing patterns → Claude invents structure
2. **Missing Multi-Tenant Fact** — not stating per-user scoping when it applies → Claude ignores ownership checks
3. **Literal Words** — under-specifying shape constraints → Claude picks a shape the codebase doesn't use
4. **Stale Plan** — prompt written from memory of an earlier plan, not current code → drift
5. **Didn't Read the Answer** — Claude stated assumptions; developer missed them
6. **Vague Debugging** — pasted only the error, not the function, file, or context
7. **Hallucinated Library** — asked for something using a library that isn't installed
8. **Trusted the SQL** — assumed correct SQL for aggregation/dates/money without verifying
9. **Regenerate Not Iterate** — restarted from scratch instead of refining the response
10. **Unbounded Scope** — didn't tell Claude what NOT to touch → Claude refactors unrelated code

---

## Process

### Step 1 — Read the prompt

Analyse immediately. No clarifying questions first.

If no prompt supplied: "Paste the prompt you want diagnosed."

### Step 2 — Score each part

PRESENT / WEAK / MISSING with one-line reason each.

### Step 3 — Identify trap matches

One line per trap: number, name, why it applies.

### Step 4 — Diagnosis report

```
## Prompt Diagnosis

### Part Scores
- Context: [PRESENT | WEAK | MISSING] — [one-line reason]
- Existing Code: [PRESENT | WEAK | MISSING] — [one-line reason]
- Request: [PRESENT | WEAK | MISSING] — [one-line reason]
- Constraints: [PRESENT | WEAK | MISSING] — [one-line reason]
- Output Format: [PRESENT | WEAK | MISSING] — [one-line reason]

### Traps Triggered
[trap number + name: one-line explanation, or "None detected"]

### Verdict
[STRONG | NEEDS WORK | WEAK]
```

STRONG = all 5 parts present (or absent for good reason), no traps  
NEEDS WORK = 1–2 parts weak/missing or 1–2 traps  
WEAK = 3+ parts missing or 3+ traps

### Step 5 — Rewrite

Fixed version addressing every WEAK/MISSING part and every triggered trap.

Rules:
- Keep the developer's intent exactly
- Use `[PLACEHOLDER]` only where the actual value is unknowable
- Do not pad — only add what was genuinely missing
- Rewrite must pass the 5-second check

```
## Fixed Prompt

[rewritten prompt, ready to paste into Claude Code]

## What Changed
- [bullet: what was added or strengthened and why]
```

### Step 6 — Teaching note (optional)

If the diagnosis reveals a repeating pattern (always skips Existing Code, always vague on constraints), add 2–3 sentences max. Only if there is a clear pattern. Do not lecture.

---

## Tone and Output Rules

- Direct, senior-dev PR review. Specific, not harsh.
- No praise for PRESENT parts — note them and move on.
- No padding, no pleasantries.
- Fixed prompt must be immediately usable.
- Never change what the developer is trying to build.
