#!/usr/bin/env bash
script=$0
echo "$script: Starting."
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
echo "$script: Finished."
