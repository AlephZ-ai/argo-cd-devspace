$i="$PSCommandPath"
$projectRoot = "$("$PSCommandPath" | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent)"
Write-Host "${i}: Started setting up environment variables."
if ($PSVersionTable.PSEdition -eq 'Core') {
    $env:PSHELL="pwsh"
} else {
    $env:PSHELL="PowerShell"
}

Set-Alias -Name "pshell" -Value "$env:PSHELL"
$env:KINDEST_ARGO_CD_PROJECT_ROOT="$projectRoot"
$env:KINDEST_ARGO_CD_COMMANDS_ROOT="$env:KINDEST_ARGO_CD_PROJECT_ROOT/commands"
$env:KINDEST_ARGO_CD_SOURCE_ROOT="$env:KINDEST_ARGO_CD_PROJECT_ROOT/src"
$env:KINDEST_ARGO_CD_SCRIPTS_ROOT="$env:KINDEST_ARGO_CD_SOURCE_ROOT/scripts"
Push-Location $env:KINDEST_ARGO_CD_PROJECT_ROOT/.devcontainer
try {
    Import-Module Set-PsEnv
    Set-PsEnv
    Write-Host "${i}: Set the environment variables."
} finally {
    Pop-Location
}

Write-Host "${i}: Set KINDEST_ARGO_CD_PROJECT_ROOT=$env:KINDEST_ARGO_CD_PROJECT_ROOT"
Write-Host "${i}: Set KINDEST_ARGO_CD_COMMANDS_ROOT=$env:KINDEST_ARGO_CD_COMMANDS_ROOT"
Write-Host "${i}: Set KINDEST_ARGO_CD_SOURCE_ROOT=$env:KINDEST_ARGO_CD_SOURCE_ROOT"
Write-Host "${i}: Set KINDEST_ARGO_CD_SCRIPTS_ROOT=$env:KINDEST_ARGO_CD_SCRIPTS_ROOT"
Write-Host "${i}: Finished setting up environment variables."
