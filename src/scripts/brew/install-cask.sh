#!/usr/bin/env bash
script=$0
tap=$1
cask=$1
echo "$script: Starting."
./src/scripts/brew/tap.sh "$tap"
brew update
brew upgrade --cask
brew install --cask "$cask"
echo "$script: Finished."
