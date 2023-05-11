./src/scripts/utils/chmod-plus-x.ps1
./src/scripts/devspace/up.ps1
$containerid = docker ps -q -f name=kindest-argo-cd-devspace
devcontainer exec --container-id "$containerid" zsh -l -c "/workspaces/kindest-argo-cd/external-argo-version"
./src/scripts/devspace/clean.ps1
