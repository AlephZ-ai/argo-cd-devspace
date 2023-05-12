#!/usr/bin/env bashpwsh
script=$0
echo "$script: Starting."
export POWERSHELL_SHELL=pwsh
export KINDEST_ARGO_CD_REPO_URL=https://github.com/AlephZ-ai/kindest-argo-cd.git
export KINDEST_ARGO_CD_CLUSTER_NAME=kindest
export KINDEST_ARGO_CD_KUBE_PORT=10443
export KINDEST_ARGO_CD_ARGO_PORT=11443
export KINDEST_ARGO_CD_ARGO_PASSWORD=password
export KINDEST_ARGO_CD_ARGO_NAME=argocd
export KINDEST_ARGO_CD_ARGO_NAMESPACE=argocd
export KINDEST_ARGO_CD_ARGO_PROJECT=default
echo "$script: Finished."
