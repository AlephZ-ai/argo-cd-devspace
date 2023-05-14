#!/usr/bin/env bash
#shellcheck disable=2016
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
# TODO: Make sure this does not get inserted multiple times
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vscode/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo touch ~/.ssh/known_hosts
sudo sh -c eval "$(ssh-keyscan github.com >> ~/.ssh/known_hosts)"
