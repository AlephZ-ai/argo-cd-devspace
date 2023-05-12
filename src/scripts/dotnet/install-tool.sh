#!/usr/bin/env bash
script=$0
tool=$1
echo "$script: Starting."
# https://github.com/dotnet/sdk/issues/10130
# Bad idea since update always updates even when tool is up to date
# dotnet tool list --global | awk 'NR > 2 {print $1}' | xargs -L1 dotnet tool update --global
if ! (dotnet tool install -g "$tool"); then
    echo "$tool$ is already installed, updating instead."
    dotnet tool install -g "$tool"
fi
echo "$script: Finished."
