$projectRoot = "$("$PSCommandPath" | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent)"
Push-Location $projectRoot/.devcontainer
try {
    Import-Module Set-PsEnv
    Set-PsEnv
} finally {
    Pop-Location
}

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
