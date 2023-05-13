param (
    [Parameter(Mandatory=$true)]
    [string]$command
)

$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent)/src/scripts"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    & "$scriptsPath/devspace/exec.ps1" --command "$command"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
