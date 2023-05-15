#!/usr/bin/env zsh
#shellcheck shell=bash
rm -f nohup.out
while ! (bash -c "NONINTERACTIVE=true && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"); do echo "Retrying Homebrew Install"; sleep 1s; done
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew=mkcert && brew install "$brew"
mkcert -install
mkdir -p ~/.ssh/
touch ~/.ssh/known_hosts
export PATH=$PATH:~/.dotnet/tools
bash -c eval "$(ssh-keyscan github.com >> ~/.ssh/known_hosts)"
dotnet dev-certs https --trust
tool=git-credential-manager && if ! (dotnet tool install -g "$tool"); then dotnet tool update -g "$tool"; fi
git-credential-manager configure
git-credential-manager diagnose
gh auth login --with-token <<< "$ALEPHZ_AI_ADMIN_GITHUB_TOKEN"
# https://github.com/sigstore/gitsign/blob/main/cmd/gitsign-credential-cache/README.md
brew update
brew upgrade
npm update -g npm
# https://stackoverflow.com/questions/33553082/how-can-i-update-all-npm-packages-modules-at-once
npm i -g npm-check-updates && ncu -u && npm i
package=@devcontainers/cli && npm install -g "$package"
package=dotenv-cli && npm install -g "$package"
module=Set-PsEnv && pwsh -command Install-Module "$module" -Force -AcceptLicense
module=Pester && pwsh -command Install-Module "$module" -Force -AcceptLicense
brew=kubefirst/tools/kubefirst && brew install "$brew"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/set-env-vars.sh"
pushd /tmp || exit
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install --fix-broken -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
popd || exit
while ! (bash -c "kubefirst k3d create "); do echo "Retrying Create Kubefirst Cluster"; sleep 1s; done
kubefirst k3d root-credentials
kubectl get pods -A
