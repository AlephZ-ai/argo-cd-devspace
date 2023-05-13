#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
echo "$script: Finished."
