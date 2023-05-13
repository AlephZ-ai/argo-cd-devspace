#!/usr/bin/env bashpwsh
# shellcheck disable=SC1091
# shellcheck source=$PROJECT_ROOT/.devcontainer/.env
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
export "$PROJECT_ROOT"="$PROJECT_ROOT"
set -o allexport
source "$PROJECT_ROOT/.devcontainer/.env"
set +o allexport
echo "$script: Environment variables set."
echo "$script: Finished."
