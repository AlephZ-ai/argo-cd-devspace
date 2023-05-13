#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
"$SCRIPTS_ROOT/utils/chmod-plus-x.sh"
"SCRIPTS_ROOT/devspace/up.sh"
containerid=$(docker ps -q -f name=kindest-argo-cd-devspace)
devcontainer exec --container-id "$containerid" zsh -l -c "$PROJECT_HOME/commands/argo-version"
"SCRIPTS_ROOT/devspace/clean.sh"
echo "$script: Finished."
