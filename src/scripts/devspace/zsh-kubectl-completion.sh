#!/usr/bin/env zsh
# shellcheck disable=SC1071
# completions must use zsh since it's the default shell in the devcontainer
source ~/.zshrc
autoload -U +X compinit && compinit
source <(kubectl completion zsh)
