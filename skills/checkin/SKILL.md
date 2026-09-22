---
name: checkin
description: Check your work in before you clear context. Writes BAGGAGE.md in the project root with your objective, progress, decisions, blockers and next action so /claim can pick it up in a fresh session. USE WHEN user says "checkin", "check in", "check my bag", "save my work", "save state", "handoff", "I'm about to clear", "context is getting full", or is about to run /clear.
---

# /checkin — check your bag before you clear

You are about to lose this session's context. Write everything the next session needs into
one file, `BAGGAGE.md`, in the project root. Then the user can `/clear` and run `/claim`.

Keep it short, specific and honest. A good bag can be read in one minute.

## Step 1 — Find the project root

```bash
git rev-parse --show-toplevel 2>/dev/null || pwd
```

`BAGGAGE.md` always goes there (next to `.git` if there is one), never in the home folder.

## Step 2 — Look at what's on disk

```bash
git status --porcelain 2>/dev/null || echo "not a git repo"
git log -1 --oneline 2>/dev/null || echo "no commits"
```

If the project keeps its own plan (`.planning/STATE.md`, `task_plan.md`, `PROJECT_LOG.md`),
read the latest state and reflect it in Progress. Don't invent one if there isn't one.

## Step 3 — Gather the session in your own words

Answer these from what actually happened this session. If any is unclear, ask the user
one short question rather than guessing.

1. **Objective** — what are we trying to get done?
2. **Done** — what got finished this session?
3. **Remaining** — what's still left?
4. **Decisions** — what did we choose, and why?
5. **Blockers** — anything stuck?
6. **Next action** — the first concrete thing to do when we're back.

## Step 4 — Write BAGGAGE.md

````markdown
---
project: [folder name]
timestamp: [ISO 8601, UTC]
---

# Baggage — [project]

## Objective
[one or two sentences]

## Progress
**Status:** [X]% · [done]/[total] items

### Done
- [x] ...

### Remaining
- [ ] ...

## Decisions
- **[decision]** — [why]

## Blockers
[None | each blocker with its status]

## Uncommitted changes
```
[git status output, or "clean"]
```

## Next action
**Start with:** [one specific, immediately doable step]

## Notes for next time
[approach, gotchas, file paths that were live, anything the next session needs]
````

## Step 5 — Confirm

```
🧳 Checked in: BAGGAGE.md

  Project    [name]
  Objective  [brief]
  Progress   [X]% · [done]/[total]
  Next       [action]

Safe to /clear. Run /claim in the new session to pick it up.
```

Only say "safe to /clear" after the file is actually written.
