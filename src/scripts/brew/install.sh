#!/usr/bin/env bash
script=$0
brew=$1
echo "$script: Starting."
brew update
brew upgrade
brew install "$brew"
echo "$script: Finished."
