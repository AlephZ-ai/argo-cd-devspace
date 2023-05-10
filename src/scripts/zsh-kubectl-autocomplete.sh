#!/usr/bin/env bash
source ~/.zshrc
autoload -U +X compinit && compinit
source <(kubectl completion zsh)
