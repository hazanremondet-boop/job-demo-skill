param(
  [Parameter(Mandatory = $true)]
  [string]$Path
)

$ErrorActionPreference = "Stop"

function Assert-ContainsAny {
  param(
    [string]$Content,
    [string[]]$Needles,
    [string]$Label
  )

  foreach ($needle in $Needles) {
    if ($Content.Contains($needle)) {
      return
    }
  }

  throw "Missing required output marker: $Label"
}

if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
  throw "Output file not found: $Path"
}

$content = Get-Content -LiteralPath $Path -Raw -Encoding UTF8

Assert-ContainsAny $content @("Codex") "complete Codex prompt"
Assert-ContainsAny $content @("AI JD", "JD") "job/demo name"
Assert-ContainsAny $content @("recruitment demand", "Recruitment Demand") "recruitment demand"
Assert-ContainsAny $content @("applicant situation", "Applicant Situation") "applicant situation"
Assert-ContainsAny $content @("React") "frontend stack"
Assert-ContainsAny $content @("Node.js", "Node") "backend stack"
Assert-ContainsAny $content @("API") "API endpoints"
Assert-ContainsAny $content @("JSON") "structured AI output"
Assert-ContainsAny $content @("Mock", "mock") "mock mode"
Assert-ContainsAny $content @("API key", "LLM_API_KEY", "serverless") "API key safety"
Assert-ContainsAny $content @("README") "README deliverable"
Assert-ContainsAny $content @(".env.example") "env example"
Assert-ContainsAny $content @("HR", "BOSS") "HR message"
Assert-ContainsAny $content @("bullet") "resume bullet"

Write-Host "[ok] skill output looks structurally complete"
