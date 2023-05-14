#!/usr/bin/env bash
command="$1"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/up.sh"
containerid=$(docker ps -q -f name="$KINDEST_ARGO_CD_PROJECT_NAME-devspace")
devcontainer exec --container-id "$containerid" zsh -l -c "$KINDEST_ARGO_CD_PROJECT_ROOT/$command"
