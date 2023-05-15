#!/usr/bin/env zsh
#shellcheck shell=bash
#shellcheck disable=SC1090
#shellcheck disable=SC2016
# Install Homebrew package manager
# TODO: This can be done with a dev container feature but the feature is currently broken. Change to that when it is fixed.
while ! (bash -c "NONINTERACTIVE=true && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"); do echo "Retrying Homebrew Install"; sleep 1s; done
# Setup zsh profile
autoload -U +X compinit && compinit
    # kubectl completion zsh profile setup
    source <(kubectl completion zsh)
    source='source <(kubectl completion zsh)'
    grep -qxF "$source"  ~/.zshrc || echo "$source" >>  ~/.zshrc
    # homebrew zsh profile setup
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vscode/.zprofile
    # Install Kubefirst
    brew=kubefirst/tools/kubefirst && brew install "$brew"
# Make container a Root CA and trust it
~/.k1/tools/mkcert -install
dotnet dev-certs https --trust
# Make any dotnet cli tools available
export PATH=$PATH:~/.dotnet/tools
# Adding GH .ssh known hosts
mkdir -p ~/.ssh/
touch ~/.ssh/known_hosts
bash -c eval "$(ssh-keyscan github.com >> ~/.ssh/known_hosts)"
# Setup git credential manager
tool=git-credential-manager && if ! (dotnet tool install -g "$tool"); then dotnet tool update -g "$tool"; fi
git-credential-manager configure
git-credential-manager diagnose
# Update package managers
# https://github.com/sigstore/gitsign/blob/main/cmd/gitsign-credential-cache/README.md
brew update
brew upgrade
npm update -g npm
# https://stackoverflow.com/questions/33553082/how-can-i-update-all-npm-packages-modules-at-once
npm i -g npm-check-updates && ncu -u && npm i
# Install needed tools, packages, modules, brew, etc...
package=@devcontainers/cli && npm install -g "$package"
package=dotenv-cli && npm install -g "$package"
module=Set-PsEnv && pwsh -command Install-Module "$module" -Force -AcceptLicense
module=Pester && pwsh -command Install-Module "$module" -Force -AcceptLicense
# Install Chrome
pushd /tmp || exit
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install --fix-broken -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
## Install Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo apt update
sudo apt install microsoft-edge-dev
popd || exit
