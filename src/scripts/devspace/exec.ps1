param (
    [Parameter(Mandatory=$true)]
    [string]$command
)

$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent)"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    & "$scriptsPath/utils/chmod-plus-x.ps1"
    & "$scriptsPath/devspace/up.ps1"
    $containerid = docker ps -q -f name="$env:KINDEST_ARGO_CD_PROJECT_NAME-devspace"
    devcontainer exec --container-id "$containerid" zsh -l -c "$env:PROJECT_ROOT/commands/$command"
    & "$scriptsPath/devspace/clean.ps1"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
