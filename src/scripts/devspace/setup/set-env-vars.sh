#!/usr/bin/env bashpwsh
script=$(basename "$0")
scriptPath="$(dirname -- "$(readlink -f -- "$script";)";)"
echo "$script: Starting."
export PSHELL="pwsh"
if [ "$KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE" = true ]; then
    # Environment setup already complete.
    # Don't log this it would be too noisy.
    return
fi

PROJECT_ROOT="$(dirname -- "$(dirname -- "$(dirname -- "$(dirname -- "$scriptPath")")")")"
export PROJECT_ROOT="$PROJECT_ROOT"
export SCRIPTS_ROOT="$PROJECT_ROOT/src/scripts"
export KINDEST_ARGO_CD_REPO_URL="https://github.com/AlephZ-ai/kindest-argo-cd.git"
export KINDEST_ARGO_CD_CLUSTER_NAME="kindest"
export KINDEST_ARGO_CD_KUBE_PORT="10443"
export KINDEST_ARGO_CD_ARGO_PORT="11443"
export KINDEST_ARGO_CD_ARGO_PASSWORD="password"
export KINDEST_ARGO_CD_ARGO_NAME="argocd"
export KINDEST_ARGO_CD_ARGO_NAMESPACE="argocd"
export KINDEST_ARGO_CD_ARGO_PROJECT="default"
export KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE="true"
echo "$script: Environment variables set."
echo "$script: Finished."
