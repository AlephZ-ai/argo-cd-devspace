#!/usr/bin/env bash
i="$0"
echo "$i: Started .zshrc setup."
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
echo "$i: Finished .zshrc setup."
