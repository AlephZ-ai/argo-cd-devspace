#!/usr/bin/env bash
i="$0"
tool="$1"
echo "$i: Started installing dotnet CLI tool: $tool."
# https://github.com/dotnet/sdk/issues/10130
# Bad idea since update always updates even when tool is up to date
# dotnet tool list --global | awk 'NR > 2 {print $1}' | xargs -L1 dotnet tool update --global
if ! (dotnet tool install -g "$tool"); then
    echo "$i: Found that dotnet CLI tool $tool is already installed, updating instead."
    dotnet tool update -g "$tool"
fi
echo "$i: Finished installing dotnet CLI tool: $tool."
