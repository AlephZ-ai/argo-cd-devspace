#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
command=$1
"$scriptsPath/devspace/setup/set-env-vars.sh"
"$SCRIPTS_ROOT/utils/chmod-plus-x.sh"
"SCRIPTS_ROOT/devspace/up.sh"
containerid=$(docker ps -q -f name="$PROJECT_NAME-devspace")
devcontainer exec --container-id "$containerid" zsh -l -c "$PROJECT_ROOT/commands/$command"
"SCRIPTS_ROOT/devspace/clean.sh"
echo "$script: Finished."
