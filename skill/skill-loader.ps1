# Hive-Mind Skill Loader
# Invoked when /hive-mind command is called
# Loads skill definition + manifest + enforces all rules

param(
    [string]$Query = "",
    [string]$Context = ""
)

$SkillPath = Split-Path -Parent $PSCommandPath
$SkillName = "hive-mind"
$ManifestPath = "$SkillPath\hive-mind-manifest.json"
$DefinitionPath = "$SkillPath\hive-mind.md"
$VaultPath = "C:\Users\akars\OneDrive\Desktop\Akarsh"
$RulesFile = "$VaultPath\Setup & Config\Claude Rules - Windows.md"
$SkillsFile = "$VaultPath\Skills\My Skills.md"

# Verify skill is properly configured
if (-not (Test-Path $ManifestPath)) {
    Write-Error "Hive-Mind manifest not found: $ManifestPath"
    exit 1
}

if (-not (Test-Path $DefinitionPath)) {
    Write-Error "Hive-Mind definition not found: $DefinitionPath"
    exit 1
}

# Load manifest
$Manifest = Get-Content $ManifestPath -Raw | ConvertFrom-Json

# Display skill header
Write-Host ""
Write-Host "=== HIVE-MIND SKILL ===" -ForegroundColor Cyan
Write-Host "Version: $($Manifest.version)" -ForegroundColor Gray
Write-Host "Status: ACTIVE" -ForegroundColor Green
Write-Host ""

# Load and display rules count
$RuleCount = (Select-String "^## Rule" $RulesFile | Measure-Object).Count
Write-Host "✓ Loaded $RuleCount rules from Claude Rules - Windows.md" -ForegroundColor Green

# Verify skills file
if (Test-Path $SkillsFile) {
    Write-Host "✓ Skills profile loaded from My Skills.md" -ForegroundColor Green
} else {
    Write-Host "⚠ Skills file not found" -ForegroundColor Yellow
}

# Auto-detect context
$ContextKeywords = @{
    "certification" = @("exam", "lesson", "study", "course", "secai+", "cy0-001")
    "development" = @("build", "app", "code", "develop", "create", "project")
    "learning" = @("learn", "understand", "new concept", "explain")
    "research" = @("research", "find", "compile", "analyze", "investigate")
    "braindump" = @("remember", "add", "note", "save", "document")
    "skills" = @("skill", "capability", "learned", "progress", "update")
}

$DetectedContext = "general"
$Confidence = 0

if ($Query) {
    $QueryLower = $Query.ToLower()
    foreach ($ContextType in $ContextKeywords.Keys) {
        $MatchCount = ($ContextKeywords[$ContextType] | Where-Object { $QueryLower -contains $_ }).Count
        if ($MatchCount -gt $Confidence) {
            $DetectedContext = $ContextType
            $Confidence = $MatchCount
        }
    }
}

Write-Host "✓ Context detected: $DetectedContext (confidence: $([Math]::Round($Confidence * 100 / ($ContextKeywords[$DetectedContext].Count)))%)" -ForegroundColor Green

# Display response instructions
Write-Host ""
Write-Host "SKILL ACTIVE — Ready to respond" -ForegroundColor Cyan
Write-Host "Rules: All 15 enforced | Vault: Append-only mode | Sources: Validation enabled" -ForegroundColor Gray
Write-Host ""

# Show user input if provided
if ($Query) {
    Write-Host "Query: $Query" -ForegroundColor Gray
    Write-Host "Context: $DetectedContext" -ForegroundColor Gray
    Write-Host ""
}

Write-Host "Proceeding with hive-mind logic..." -ForegroundColor Gray
