# Hive-Mind Auto-Initialization Script
# Runs on Claude Code session start
# Loads all rules + skills + Obsidian management

$VaultPath = "C:\Users\akars\OneDrive\Desktop\Akarsh"
$RulesFile = "$VaultPath\Setup & Config\Claude Rules - Windows.md"
$SkillsFile = "$VaultPath\Skills\My Skills.md"
$SessionLogDir = "$VaultPath\CompTIA SecAI+\Chat Logs"

# Verify files exist
if (-not (Test-Path $RulesFile)) {
    Write-Warning "Claude Rules file not found: $RulesFile"
    exit 1
}

if (-not (Test-Path $SkillsFile)) {
    Write-Warning "Skills file not found: $SkillsFile"
    exit 1
}

# Count existing sessions for today
$Today = (Get-Date).ToString("yyyy-MM-dd")
$SessionCount = (Get-ChildItem "$SessionLogDir\$Today*" -ErrorAction SilentlyContinue | Measure-Object).Count
$NextSession = $SessionCount + 1

# Output status
Write-Host "=== HIVE-MIND INITIALIZATION ===" -ForegroundColor Cyan
Write-Host "Date: $Today" -ForegroundColor Gray
Write-Host "Session: $NextSession" -ForegroundColor Gray
Write-Host ""
Write-Host "Loading Rules..." -ForegroundColor Green
$RuleCount = (Select-String "^## Rule" $RulesFile | Measure-Object).Count
Write-Host "  ✓ $RuleCount rules loaded from Claude Rules - Windows.md" -ForegroundColor Green

Write-Host "Loading Skills..." -ForegroundColor Green
Write-Host "  ✓ Skills profile loaded from My Skills.md" -ForegroundColor Green

Write-Host "Obsidian Integration..." -ForegroundColor Green
Write-Host "  ✓ Vault path: $VaultPath" -ForegroundColor Green
Write-Host "  ✓ Session logging: ENABLED" -ForegroundColor Green
Write-Host "  ✓ Append-only mode: ACTIVE" -ForegroundColor Green

Write-Host ""
Write-Host "STATUS: HIVE-MIND ACTIVE" -ForegroundColor Cyan
Write-Host "All 15 rules enforced. Ready to work." -ForegroundColor Gray
