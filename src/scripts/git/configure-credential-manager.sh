#!/usr/bin/env bash
script=$(basename "$0")
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
echo "$script: Starting."
git-credential-manager configure
echo "$script: Finished."
