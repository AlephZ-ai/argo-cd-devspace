#!/usr/bin/env bash
echo "setup-zshrc.sh: Starting."
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
echo "setup-zshrc.sh: Finished."
