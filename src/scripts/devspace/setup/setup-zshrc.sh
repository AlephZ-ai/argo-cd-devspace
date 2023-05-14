#!/usr/bin/env zsh
#shellcheck shell=bash
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
grep -qxF "$source"  ~/.zprofile || echo "$source" >>  ~/.zprofile
