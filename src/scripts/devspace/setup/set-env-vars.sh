#!/usr/bin/env bash
# shellcheck disable=SC1091
# shellcheck source=$PROJECT_ROOT/.devcontainer/.env
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$(dirname "$scriptPath")")"
script="$scriptPath/$script"
echo "$script: Starting."
export PSHELL="pwsh"
if [ "$KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE" != "true" ]; then
    PROJECT_ROOT="$(dirname "$(dirname "$scriptsPath")")"
    export PROJECT_ROOT="$PROJECT_ROOT"
    echo "$script: PROJECT_ROOT=$PROJECT_ROOT"
    set -o allexport
    source "$PROJECT_ROOT/.devcontainer/.env"
    set +o allexport
    echo "$script: Environment variables set."
fi

echo "$script: Finished."
