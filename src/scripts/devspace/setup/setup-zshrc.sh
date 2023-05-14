#!/usr/bin/env zsh
#shellcheck shell=bash
#shellcheck disable=2016
source='source <(kubectl completion zsh)'
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vscode/.zprofile
grep -qxF "$source"  ~/.zprofile || echo "$source" >>  ~/.zprofile
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
