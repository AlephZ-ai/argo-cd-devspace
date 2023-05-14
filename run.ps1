param (
    [Parameter(Mandatory=$true)]
    [string]$script
)

$i = "$PSCommandPath"
$scriptsRoot = Join-Path "$("$i" | Resolve-Path -Relative:$false | Split-Path -Parent)" "src/scripts"
Write-Host "${i}: Started running: ${script}."
try {
    & "$scriptsRoot/setup/set-env-vars.ps1"
    & "$scriptsRoot/$script.ps1"
} catch [System.Exception] {
    Write-Error "${i}: Failed running: ${script}. Error: $_"
    exit 1
} finally {
   Write-Host "${i}: Finished running: ${script}."
}
