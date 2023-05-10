#!/usr/bin/env zsh
source ~/.zshrc
autoload -U +X compinit && compinit
source <(kubectl completion zsh)
