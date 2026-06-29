# VGX Prompt Formula Reference

<!-- © 2026 VGX Global Consulting (OPC) Pvt Ltd. All rights reserved. -->

## The 5-Part Formula

Every effective developer prompt contains some combination of these five parts. When a prompt fails, a missing or weak part is almost always why.

| Part | What it provides | Missing when... |
|---|---|---|
| **1. Context** | Project, stack, current state, what's NOT in scope | Claude produces generic code that doesn't fit the project |
| **2. Existing Code** | File or function Claude should match | Claude invents structure instead of matching what's there |
| **3. Request** | Specific thing to do, scoped and bounded | Claude over-builds, goes too broad, or misunderstands the task |
| **4. Constraints** | Library choices, naming, patterns, security rules, what NOT to change | Claude ignores conventions, uses wrong libraries, violates rules |
| **5. Output Format** | How the response should be shaped | Claude wraps code in explanation, returns whole file when a snippet was wanted |

**Key insight:** The Request is typically the *smallest* part. Context + Existing Code + Constraints do most of the work.

---

## The 5-Second Check

Run these before hitting enter:

1. Does Claude know what project this is?
2. Did I show it a reference file or function?
3. Is my ask one specific, scoped thing?
4. Did I state rules that aren't obvious from the code?
5. Did I say what I DON'T want?

---

## The Ten Prompting Traps

Flag by number and name when they apply to the prompt being diagnosed.

| # | Name | What it looks like | Why it fails |
|---|---|---|---|
| 1 | No Existing Code | Asking for new code without showing existing patterns | Claude invents structure instead of matching what's already there |
| 2 | Missing Multi-Tenant Fact | Not stating per-user scoping when it applies | Claude ignores ownership checks, returns all records |
| 3 | Literal Words | Under-specifying shape constraints | Claude picks a response shape the codebase doesn't use |
| 4 | Stale Plan | Prompt written from memory of earlier plan, not current code | Drift between what was planned and what now exists |
| 5 | Didn't Read the Answer | Claude stated assumptions; developer skipped past them | Developer accepts code that doesn't match their actual setup |
| 6 | Vague Debugging | Pasted only the error, not the function, file, or context | Claude guesses at root cause without enough information |
| 7 | Hallucinated Library | Asked for something using a library not installed | Claude produces code that won't run |
| 8 | Trusted the SQL | Assumed correct SQL output for aggregation/dates/money | Silent data errors that pass all tests |
| 9 | Regenerate Not Iterate | Restarted from scratch instead of refining the response | Lost Claude's partial progress; same missing context repeats |
| 10 | Unbounded Scope | Didn't tell Claude what NOT to touch | Claude refactors unrelated code, breaks things that worked |

---

## Scoring Reference

Use these definitions when assigning PRESENT / WEAK / MISSING:

- **PRESENT** — clearly provided, sufficient for Claude to act correctly
- **WEAK** — present but vague, incomplete, or underspecified in a way that risks a bad output
- **MISSING** — not present at all; Claude would have to guess or invent

## Verdict Thresholds

- **STRONG** — all 5 parts present (or absent for legitimate reason) and no traps triggered
- **NEEDS WORK** — 1–2 parts weak/missing, or 1–2 traps triggered
- **WEAK** — 3+ parts missing, or 3+ traps triggered

---

## Analysis Prompt (for non-code tasks)

The "Existing Code" part of the formula applies differently for analysis tasks (audit, review, diagnose). Map it as follows:

| Standard formula | Analysis equivalent |
|---|---|
| Existing Code — show Claude what to match | Show Claude *where to look* — paths, directories, repo locations |

A prompt asking Claude to audit repositories with no paths given fails on "Existing Code" even though it contains no code-generation request.
