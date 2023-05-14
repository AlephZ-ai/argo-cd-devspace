param (
    [Parameter(Mandatory=$true)]
    [string]$script,
    [Parameter(Mandatory=$false)]
    [string]$command
)

$i = "$("$PSCommandPath" | Resolve-Path -Relative:$false)"
$scriptsRoot = Join-Path "$("$i" | Resolve-Path -Relative:$false | Split-Path -Parent)" "src/scripts"
Write-Host "${i}: Started running: ${script}."
try {
    & "$scriptsRoot/devspace/setup/set-env-vars.ps1"
    if ($command -eq $null) {
        $result = & "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/$script.ps1"
    } else {
        $result = & "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/$script.ps1" -command $command
    }
    return $result
} catch [System.Exception] {
    Write-Error "${i}: Failed running: ${script}. Error: $_"
    exit 1
} finally {
   Write-Host "${i}: Finished running: ${script}."
}
