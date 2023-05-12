#!/usr/bin/env bash
script=$0
echo "$script: Starting."
"$SCRIPTS_ROOT/dotnet/install-tool.sh" git-credential-manager
echo "$script: Finished."
