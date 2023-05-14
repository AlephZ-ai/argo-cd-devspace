param (
    [Parameter(Mandatory=$true)]
    [string]$command
)

$i="$PSCommandPath"
Write-Host "${i}: Started executing command: $command on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
& "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/up.ps1"
$containerid = docker ps -q -f name="$env:KINDEST_ARGO_CD_PROJECT_NAME-devspace"
devcontainer exec --container-id "$containerid" zsh -l -c "`$KINDEST_ARGO_CD_PROJECT_ROOT/run` $command"
Write-Host "${i}: Finished executing command: $command on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
