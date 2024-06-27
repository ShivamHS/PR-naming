
param (
   [string]$pattern = $env:INPUT_PATTERN
)
$ErrorActionPreference = "Stop"
try {
  
   $githubContext = $env:GITHUB_CONTEXT | ConvertFrom-Json
  
   $prTitle = $githubContext.event.pull_request.title
   if (-not ($prTitle -match $pattern)) {
       throw "PR title '$prTitle' does not match the pattern '$pattern'."
   } else {
       Write-Output "PR title '$prTitle' matches the pattern '$pattern'."
   }
} catch {
   Write-Error $_.Exception.Message
   exit 1
}
