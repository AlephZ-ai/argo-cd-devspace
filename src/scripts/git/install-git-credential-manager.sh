#!/usr/bin/env bash
script=$0
echo "$script: Starting."
./src/scripts/dotnet/install-tool.sh git-credential-manager
echo "$script: Finished."
