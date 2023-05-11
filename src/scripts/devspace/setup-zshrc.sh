#!/usr/bin/env bash
kubectlSource='source <(kubectl completion zsh)'
grep -qxF "$kubectlSource"  ~/.zshrc || echo "$kubectlSource" >>  ~/.zshrc
