$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
try {
    "$SCRIPTS_ROOT/utils/chmod-plus-x.ps1"
    "$SCRIPTS_ROOT/devspace/up.ps1"
    $containerid = docker ps -q -f name=kindest-argo-cd-devspace
    devcontainer exec --container-id "$containerid" zsh -l -c "$PROJECT_ROOT/commands/argo-version"
    "$SCRIPTS_ROOT/devspace/clean.ps1"
} catch [System.Exception] {
    Write-Error "${commandPath}: Error: $_"
    exit 1
} finally {
   Write-Host "${commandPath}: Finished."
}
