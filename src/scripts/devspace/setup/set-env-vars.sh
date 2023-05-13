#!/usr/bin/env bash
# shellcheck disable=SC1091
# shellcheck source=$PROJECT_ROOT/.devcontainer/.env
script=$(basename "$0")
echo "$script: Starting."
export PSHELL="pwsh"
if [ "$KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE" = true ]; then
    # Environment setup already complete.
    # Don't log this it would be too noisy.
    exit
fi

PROJECT_ROOT="$(dirname "$(dirname "$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")")")")"
echo "$script: PROJECT_ROOT=$PROJECT_ROOT"
export PROJECT_ROOT="$PROJECT_ROOT"
export SCRIPTS_ROOT="$PROJECT_ROOT/src/scripts"
set -o allexport
source "$PROJECT_ROOT/.devcontainer/.env"
set +o allexport
echo "$script: Environment variables set."
echo "$script: Finished."
