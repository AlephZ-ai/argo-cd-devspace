#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
brew=$1
brew update
brew upgrade
brew install "$brew"
echo "$script: Finished."
