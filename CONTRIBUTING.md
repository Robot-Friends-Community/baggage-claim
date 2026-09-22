# Contributing to Baggage Claim

Thanks for helping keep the small thing small.

Baggage Claim is deliberately tiny: two skills, one file. Contributions that make it clearer
or more reliable are very welcome. Contributions that make it bigger probably belong in
[Airport Authority](https://github.com/Robot-Friends-Community/airport-authority) instead —
that's the full edition, and this one stays the beginner edition on purpose.

## Quick start

1. Fork this repo
2. Point Claude Code at your fork (see below)
3. Make your change on a feature branch
4. Try it: run `/checkin`, `/clear`, then `/claim` in a real project
5. Open a PR against `main`

## Trying your changes locally

```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/baggage-claim.git
cd baggage-claim

# Load it as a local plugin (picks up edits in place)
claude plugin marketplace add ./
claude plugin install baggage-claim@baggage-claim
```

Or copy the two skills by hand with `bash install.sh` / `.\install.ps1`.

## What to contribute

- **Clearer wording** in the skills or the README — this is for people who don't read docs
- **Bug fixes** — a bag that didn't get written, a claim that missed it
- **Better summaries** — the checkin / claim banners
- **Translations** of the README

## What not to contribute here

- A build log, a recorder, a tome, git hygiene, hooks, fleet views — all of that lives in
  Airport Authority already. Add it there.

## Pull request checklist

- [ ] `/checkin` writes `BAGGAGE.md` in the project root
- [ ] `/claim` finds it, shows the summary, and suggests the next action
- [ ] `/claim` still reads an old `HANDOFF-ALLEYOOP.md` if that's all it finds
- [ ] No absolute paths, no personal folders
- [ ] `CHANGELOG.md` updated under `## [Unreleased]`

## Questions?

Open an issue or start a Discussion.
