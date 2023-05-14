#!/usr/bin/env bash
tool="$1"
# https://github.com/dotnet/sdk/issues/10130
# Bad idea since update always updates even when tool is up to date
# dotnet tool list --global | awk 'NR > 2 {print $1}' | xargs -L1 dotnet tool update --global
if ! (dotnet tool install -g "$tool"); then
    dotnet tool update -g "$tool"
fi
