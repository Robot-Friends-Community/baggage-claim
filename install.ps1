# Baggage Claim — manual install (Windows PowerShell). Prefer the plugin install in the README.
# Usage: .\install.ps1

$claudeDir = if ($env:CLAUDE_DIR) { $env:CLAUDE_DIR } else { "$env:USERPROFILE\.claude" }
$skills = "$claudeDir\skills"

Write-Host ""
Write-Host "Baggage Claim -- installer"
Write-Host "=========================="
Write-Host ""

if (-not (Test-Path $claudeDir)) {
    Write-Error "Claude Code config directory not found at $claudeDir"
    Write-Error "Make sure Claude Code is installed: https://claude.ai/code"
    exit 1
}

New-Item -ItemType Directory -Force "$skills\checkin", "$skills\claim" | Out-Null
Copy-Item skills\checkin\SKILL.md "$skills\checkin\"
Copy-Item skills\claim\SKILL.md "$skills\claim\"

# Clean up the older no-look-pass edition if it's there
$removed = @()
foreach ($old in "$skills\no-look-pass", "$claudeDir\commands\alleyoop.md", "$claudeDir\commands\slamdunk.md") {
    if (Test-Path $old) { Remove-Item -Recurse -Force $old; $removed += $old }
}

Write-Host "Installed:"
Write-Host "  $skills\checkin\SKILL.md"
Write-Host "  $skills\claim\SKILL.md"
if ($removed.Count) { Write-Host "Removed the old no-look-pass edition:"; $removed | ForEach-Object { Write-Host "  $_" } }
Write-Host ""
Write-Host "Done. Open Claude Code in any project folder and run:"
Write-Host "  /checkin"
Write-Host ""
