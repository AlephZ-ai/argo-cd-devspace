#!/usr/bin/env bash
# shellcheck disable=SC1091
# shellcheck source=$PROJECT_ROOT/.devcontainer/.env
script=$(basename "$0")
echo "$script: Starting."
export PSHELL="pwsh"
if [ "$KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE" != "true" ]; then
    PROJECT_ROOT="$(dirname "$(dirname "$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")")")")"
    export PROJECT_ROOT="$PROJECT_ROOT"
    export SCRIPTS_ROOT="$PROJECT_ROOT/src/scripts"
    echo "$script: PROJECT_ROOT=$PROJECT_ROOT"
    echo "$script: SCRIPTS_ROOT=$SCRIPTS_ROOT"
    set -o allexport
    source "$PROJECT_ROOT/.devcontainer/.env"
    set +o allexport
    echo "$script: Environment variables set."
fi

echo "$script: Finished."
