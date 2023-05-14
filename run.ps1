param (
    [Parameter(Mandatory=$true)]
    [string]$script,
    [Parameter(Mandatory=$false)]
    [string]$command
)

$scriptsRoot = Join-Path "$("$PSCommandPath" | Resolve-Path -Relative:$false | Split-Path -Parent)" "src/scripts"
& "$scriptsRoot/devspace/setup/set-env-vars.ps1"
if ($command -eq $null) {
    $result = & "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/$script.ps1"
} else {
    $result = & "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/$script.ps1" -command $command
}

return $result
