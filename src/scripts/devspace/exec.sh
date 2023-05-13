#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
command=$1
"$scriptsPath/devspace/setup/set-env-vars.sh"
"$scriptsPath/utils/chmod-plus-x.sh"
"$scriptsPath/devspace/up.sh"
containerid=$(docker ps -q -f name="$KINDEST_ARGO_CD_PROJECT_NAME-devspace")
devcontainer exec --container-id "$containerid" zsh -l -c "$PROJECT_ROOT/commands/$command"
"$scriptsPath/devspace/clean.sh"
echo "$script: Finished."
