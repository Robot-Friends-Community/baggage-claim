---
name: claim
description: Claim your bag in a fresh session. Reads BAGGAGE.md (written by /checkin), shows where you left off, and suggests the next action. USE WHEN user says "claim", "claim my bag", "resume", "pick up where we left off", "continue from last session", "where was I", "restore my session", or has just started a session in a project that has a BAGGAGE.md.
---

# /claim — pick your bag up on the other side

Restore the previous session's context from `BAGGAGE.md` and hand the user a next step.

## Step 1 — Find the bag

Check, in order:

1. `BAGGAGE.md` in the current directory
2. `BAGGAGE.md` in the git root
3. `HANDOFF-ALLEYOOP.md` in either place (a bag from the older no-look-pass edition — read it the same way)

```bash
# Outside a git repo GIT_ROOT falls back to the cwd — never the filesystem root.
GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
for f in BAGGAGE.md "$GIT_ROOT/BAGGAGE.md" HANDOFF-ALLEYOOP.md "$GIT_ROOT/HANDOFF-ALLEYOOP.md"; do
  test -f "$f" && echo "found: $f" && break
done
```

**No bag?** Say so plainly, then offer: start fresh, or look at recent git history for clues.
Don't pretend to restore something that isn't there.

## Step 2 — Read it

Pull out: project, timestamp, objective, progress (done / remaining), decisions, blockers,
next action, notes.

## Step 3 — Check whether the world moved

```bash
git status --porcelain 2>/dev/null
git log -3 --oneline 2>/dev/null
```

If there are commits or changed files newer than the bag's timestamp, note them — the bag
may be slightly behind reality.

## Step 4 — Show the summary

```
🧳 Claimed: BAGGAGE.md  ([timestamp])

  Project    [name]
  Objective  [objective]
  Progress   [X]% · [done]/[total]

  Remaining
    ☐ ...
    ☐ ...

  Decisions kept
    • ...

  Blockers   [None | list]
  Since checkin   [new commits / changes — only if any]

  ➡️  Next   [the bag's next action, or the blocker if there is one]

Ready to continue? [Y/n]
```

If there's a blocker, lead with it. Otherwise use the bag's next action as written.

## Step 5 — Tidy up

Once the user confirms, ask what to do with the bag:

- **Delete** (default — it's served its purpose)
- **Keep** for reference
- **Archive** to `.baggage-archive/BAGGAGE-[timestamp].md`

Then get on with the next action.
