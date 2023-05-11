./src/scripts/utils/chmod-plus-x.ps1
./src/scripts/devspace/build.ps1
$containerid = docker ps -q -f name=kindest-argo-cd_devcontainer
devcontainer exec --container-id "$containerid" argocd version --short
./src/scripts/devspace/clean.ps1
