$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    & "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)/devspace/setup/set-env-vars.ps1"
    & "$env:SCRIPTS_ROOT/utils/chmod-plus-x.ps1"
    & "$env:SCRIPTS_ROOT/devspace/up.ps1"
    $containerid = docker ps -q -f name=kindest-argo-cd-devspace
    devcontainer exec --container-id "$containerid" zsh -l -c "$env:PROJECT_ROOT/commands/argo-version"
    & "$env:SCRIPTS_ROOT/devspace/clean.ps1"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
