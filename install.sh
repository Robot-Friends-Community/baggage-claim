#!/usr/bin/env bash
# Baggage Claim — manual install (macOS / Linux). Prefer the plugin install in the README.
# Usage: bash install.sh
set -e

CLAUDE_DIR="${CLAUDE_DIR:-$HOME/.claude}"
SKILLS="$CLAUDE_DIR/skills"

echo ""
echo "Baggage Claim — installer"
echo "========================="
echo ""

if [ ! -d "$CLAUDE_DIR" ]; then
  echo "ERROR: Claude Code config directory not found at $CLAUDE_DIR"
  echo "       Make sure Claude Code is installed: https://claude.ai/code"
  exit 1
fi

mkdir -p "$SKILLS/checkin" "$SKILLS/claim"
cp skills/checkin/SKILL.md "$SKILLS/checkin/"
cp skills/claim/SKILL.md "$SKILLS/claim/"

# Clean up the older no-look-pass edition if it's there
removed=""
for old in "$SKILLS/no-look-pass" "$CLAUDE_DIR/commands/alleyoop.md" "$CLAUDE_DIR/commands/slamdunk.md"; do
  if [ -e "$old" ]; then rm -rf "$old"; removed="$removed\n  $old"; fi
done

echo "Installed:"
echo "  $SKILLS/checkin/SKILL.md"
echo "  $SKILLS/claim/SKILL.md"
[ -n "$removed" ] && printf "Removed the old no-look-pass edition:%b\n" "$removed"
echo ""
echo "Done. Open Claude Code in any project folder and run:"
echo "  /checkin"
echo ""
