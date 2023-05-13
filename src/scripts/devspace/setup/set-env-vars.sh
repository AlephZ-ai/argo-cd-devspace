#!/usr/bin/env bash
# shellcheck disable=SC1091
# shellcheck source=$KINDEST_ARGO_CD_PROJECT_ROOT/.devcontainer/.env
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$(dirname "$scriptPath")")"
script="$scriptPath/$script"
echo "$script: Starting."
export PSHELL="pwsh"
if [ "$KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE" != "true" ]; then
    KINDEST_ARGO_CD_PROJECT_ROOT="$(dirname "$(dirname "$scriptsPath")")"
    export KINDEST_ARGO_CD_PROJECT_ROOT="$KINDEST_ARGO_CD_PROJECT_ROOT"
    echo "$script: KINDEST_ARGO_CD_PROJECT_ROOT=$KINDEST_ARGO_CD_PROJECT_ROOT"
    set -o allexport
    source "$KINDEST_ARGO_CD_PROJECT_ROOT/.devcontainer/.env"
    set +o allexport
    echo "$script: Environment variables set."
fi

echo "$script: Finished."
