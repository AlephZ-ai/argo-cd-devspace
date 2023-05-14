#!/usr/bin/env zsh
#shellcheck shell=bash
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zprofile || echo "$source" >>  ~/.zprofile
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
