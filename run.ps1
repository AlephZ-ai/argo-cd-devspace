param (
    [Parameter(Mandatory=$true)]
    [string]$script
)

$i = "$("$PSCommandPath" | Resolve-Path -Relative:$false)"
$scriptsRoot = Join-Path "$("$i" | Resolve-Path -Relative:$false | Split-Path -Parent)" "src/scripts"
Write-Host "${i}: Started running: ${script}."
try {
    & "$scriptsRoot/devspace/setup/set-env-vars.ps1"
    & "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/$script.ps1"
} catch [System.Exception] {
    Write-Error "${i}: Failed running: ${script}. Error: $_"
    exit 1
} finally {
   Write-Host "${i}: Finished running: ${script}."
}
