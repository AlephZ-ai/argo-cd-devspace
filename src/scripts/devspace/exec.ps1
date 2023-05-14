param (
    [Parameter(Mandatory=$true)]
    [string]$command
)

& "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/up.ps1"
$containerid = docker ps -q -f name="$env:KINDEST_ARGO_CD_PROJECT_NAME-devspace"
devcontainer exec --container-id "$containerid" zsh -l -c "`$KINDEST_ARGO_CD_PROJECT_ROOT/run` $command"
