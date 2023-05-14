#!/usr/bin/env zsh
#shellcheck shell=bash
# shellcheck disable=SC1091
# shellcheck source=$KINDEST_ARGO_CD_PROJECT_ROOT/.devcontainer/.env
projectRoot="$(dirname "$(dirname "$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE-$0}")" &> /dev/null && pwd)")")")")"
set -o allexport
source "$projectRoot/.devcontainer/.env"
set +o allexport
export PSHELL="pwsh"
export KINDEST_ARGO_CD_PROJECT_ROOT="$projectRoot"
export KINDEST_ARGO_CD_COMMANDS_ROOT="$KINDEST_ARGO_CD_PROJECT_ROOT/commands"
export KINDEST_ARGO_CD_SOURCE_ROOT="$KINDEST_ARGO_CD_PROJECT_ROOT/src"
export KINDEST_ARGO_CD_SCRIPTS_ROOT="$KINDEST_ARGO_CD_SOURCE_ROOT/scripts"
