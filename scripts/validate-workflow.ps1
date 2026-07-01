param(
  [switch]$SkipInstalledSkillCompare
)

$ErrorActionPreference = "Stop"

function Write-Step {
  param([string]$Message)
  Write-Host "[check] $Message"
}

function Assert-File {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    throw "Missing required file: $Path"
  }
}

function Assert-Directory {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
    throw "Missing required directory: $Path"
  }
}

function Assert-Contains {
  param(
    [string]$Path,
    [string]$Text
  )
  $content = Get-Content -LiteralPath $Path -Raw -Encoding UTF8
  if (-not $content.Contains($Text)) {
    throw "Expected '$Path' to contain: $Text"
  }
}

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $repoRoot

$repoSkill = Join-Path $repoRoot "skills\jd-to-demo-workflow"
$installedSkill = Join-Path $env:USERPROFILE ".codex\skills\jd-to-demo-workflow"
$validator = Join-Path $env:USERPROFILE ".codex\skills\.system\skill-creator\scripts\quick_validate.py"

Write-Step "checking required files"
Assert-File "README.md"
Assert-File "docs\skill-usage.md"
Assert-File "docs\skill-installation.md"
Assert-File "docs\validation.md"
Assert-File "examples\skill-forward-test.md"
Assert-File "examples\skill-forward-test-expected-output.md"
Assert-File "tools\demo-workflow\index.html"
Assert-Directory $repoSkill
Assert-File (Join-Path $repoSkill "SKILL.md")
Assert-File (Join-Path $repoSkill "agents\openai.yaml")
Assert-File (Join-Path $repoSkill "references\codex-prompt.md")
Assert-File (Join-Path $repoSkill "references\screenshot-analysis.md")

Write-Step "checking documentation links and sample markers"
Assert-Contains "README.md" "docs/skill-usage.md"
Assert-Contains "README.md" "skills/jd-to-demo-workflow"
Assert-Contains "README.md" "examples/skill-forward-test-expected-output.md"
Assert-Contains "examples\skill-forward-test.md" 'Use $jd-to-demo-workflow'
Assert-Contains "examples\skill-forward-test.md" "Codex"
Assert-Contains "examples\skill-forward-test-expected-output.md" "AI JD"
Assert-Contains "examples\skill-forward-test-expected-output.md" "API key"

Write-Step "checking golden skill output structure"
powershell -ExecutionPolicy Bypass -File ".\scripts\check-skill-output.ps1" -Path ".\examples\skill-forward-test-expected-output.md"
if ($LASTEXITCODE -ne 0) {
  throw "Golden skill output structure check failed."
}

Write-Step "validating repo skill"
if (-not (Test-Path -LiteralPath $validator -PathType Leaf)) {
  throw "Missing skill validator: $validator"
}
python $validator $repoSkill
if ($LASTEXITCODE -ne 0) {
  throw "Repo skill validation failed."
}

if (-not $SkipInstalledSkillCompare) {
  Write-Step "validating installed skill"
  Assert-Directory $installedSkill
  python $validator $installedSkill
  if ($LASTEXITCODE -ne 0) {
    throw "Installed skill validation failed."
  }

  Write-Step "comparing installed skill with repo skill"
  git diff --no-index -- $installedSkill $repoSkill | Out-Host
  if ($LASTEXITCODE -ne 0) {
    throw "Installed skill differs from repo skill."
  }
}

Write-Step "checking HTML script syntax"
$nodeCheck = @'
const fs = require("fs");
const vm = require("vm");
const html = fs.readFileSync("tools/demo-workflow/index.html", "utf8");
const scripts = [...html.matchAll(/<script>([\s\S]*?)<\/script>/g)].map(match => match[1]);
for (const script of scripts) {
  new vm.Script(script);
}
console.log("scripts ok", scripts.length);
'@
$nodeCheckPath = Join-Path $env:TEMP "validate-demo-workflow.js"
Set-Content -LiteralPath $nodeCheckPath -Value $nodeCheck -Encoding UTF8
try {
  node $nodeCheckPath
  if ($LASTEXITCODE -ne 0) {
    throw "HTML script syntax check failed."
  }
}
finally {
  Remove-Item -LiteralPath $nodeCheckPath -Force -ErrorAction SilentlyContinue
}

Write-Host "[ok] workflow validation passed"
