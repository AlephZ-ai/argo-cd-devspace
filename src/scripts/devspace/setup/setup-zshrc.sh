#!/usr/bin/env bash
#shellcheck disable=2016
source='source <(kubectl completion zsh)'
grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
# TODO: Make sure this does not get inserted multiple times
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vscode/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sude mkdir -p ~/.ssh/
chown vscode:vscode ~/.ssh/
sudo touch ~/.ssh/known_hosts
sudo bash -c eval "$(ssh-keyscan github.com >> ~/.ssh/known_hosts)"
