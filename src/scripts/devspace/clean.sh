#!/usr/bin/env bash
#shellcheck disable=SC2034
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
for i in {1..3}
do
    containerid=$(docker ps -q -f name="$KINDEST_ARGO_CD_PROJECT_NAME-devspace")
    if [ -n "$containerid" ]; then
        docker rm -f "$containerid"
    fi
    volumes=$(docker volume ls -q -f name=name="${KINDEST_ARGO_CD_PROJECT_NAME}_devcontainer")
    if [ -n "$volumes" ]; then
        echo "$volumes" | xargs docker volume rm -f
    fi

    docker container prune -f
    docker image prune -a -f
    docker network prune -f
    docker volume prune -f
done
