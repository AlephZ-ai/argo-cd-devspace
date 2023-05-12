#!/usr/bin/env bash
script=$0
echo "$script: Starting."
./src/scripts/brew/tap.sh microsoft/git
./src/scripts/brew/install-cask.sh git-credential-manager-core
echo "$script: Finished."
