#!/usr/bin/env bash
script=$(basename "$0")
"$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
echo "$script: Starting."
"$SCRIPTS_ROOT/dotnet/install-tool.sh" git-credential-manager
echo "$script: Finished."
