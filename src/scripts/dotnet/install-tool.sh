#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
tool=$1
# https://github.com/dotnet/sdk/issues/10130
# Bad idea since update always updates even when tool is up to date
# dotnet tool list --global | awk 'NR > 2 {print $1}' | xargs -L1 dotnet tool update --global
if ! (dotnet tool install -g "$tool"); then
    echo "$tool$ is already installed, updating instead."
    dotnet tool update -g "$tool"
fi
echo "$script: Finished."
