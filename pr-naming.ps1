
param (
    [string]$Token = $env:INPUT_TOKEN,  
    [string]$Owner = $env:INPUT_OWNER,
    [string]$Repo = $env:INPUT_REPO,
    [string]$Pattern = $env:INPUT_PATTERN
)


$headers = @{
    Authorization = "Bearer $Token"
}

Write-Host "$Token, $Owner, $Pattern, $Repo"

$prUrl = "https://api.github.com/repos/$Owner/$Repo/pulls"
$prs = Invoke-RestMethod -Uri $prUrl -Headers $headers

foreach ($pr in $prs) {
    $prTitle = $pr.title
    if ($prTitle -match $Pattern) {
        Write-Host "PR #$($pr.number): Title is valid: $prTitle"
    } else {
        Write-Host "PR #$($pr.number): Invalid title: $prTitle"
    }
}
