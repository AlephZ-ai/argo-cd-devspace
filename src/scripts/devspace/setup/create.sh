#!/usr/bin/env zsh
#shellcheck shell=bash
#shellcheck disable=2016
rm -f nohup.out
while ! (bash -c "NONINTERACTIVE=true && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"); do echo "Retrying Homebrew Install"; sleep 1s; done
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew=mkcert && brew install "$brew"
mkdir -p ~/.ssh/
touch ~/.ssh/known_hosts
export PATH=$PATH:~/.dotnet/tools
bash -c eval "$(ssh-keyscan github.com >> ~/.ssh/known_hosts)"
dotnet dev-certs https --trust
tool=git-credential-manager && if ! (dotnet tool install -g "$tool"); then dotnet tool update -g "$tool"; fi
git-credential-manager configure
git-credential-manager diagnose
gh auth login
# https://github.com/sigstore/gitsign/blob/main/cmd/gitsign-credential-cache/README.md
while ("caching \$GITHUBTOKEN"); gitsign-credential-cache; do true; done &
brew update
brew upgrade
npm update -g npm
npm i -g npm-check-updates && ncu -u && npm i
package=@devcontainers/cli && npm install -g "$package"
package=dotenv-cli && npm install -g "$package"
module=Set-PsEnv && pwsh -command Install-Module "$module" -Force -AcceptLicense
module=Pester && pwsh -command Install-Module "$module" -Force -AcceptLicense
brew=kubefirst/tools/kubefirst && brew install "$brew"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/kubefirst/create.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/setup-zshrc.sh"

# https://stackoverflow.com/questions/33553082/how-can-i-update-all-npm-packages-modules-at-once
