#shellcheck shell=bash
#shellcheck source=/dev/null
pushd /tmp || exit
# Update the list of packages
sudo apt-get update
# Install pre-requisite packages.
sudo apt install sudo openssl apt-transport-https ca-certificates checkinstall dos2unix shellcheck file wget curl git zsh procps software-properties-common transport-https libnss3 libnss3-tools build-essential zlib1g-dev gcc bash-completion age/bullseye-backports age postgresql-client powerline fonts-powerline gedit gimp nautilus vlc x11-apps -y
# Set zsh default
sudo "$(whoami)" chsh -s /bin/zsh
touch ~/.zshenv
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# Get Ubuntu version
repo_version=$(if command -v lsb_release &> /dev/null; then lsb_release -r -s; else grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"'; fi)
declare repo_version="$repo_version"
# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/$repo_version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
# Install Microsoft signing key and repository
sudo dpkg -i packages-microsoft-prod.deb
# Clean up
rm -rf packages-microsoft-prod.deb
# Install Dotnet SDK versions
sudo apt-get update
sudo apt install dotnet-sdk-6.0 dotnet-sdk-7.0 -y
# Install PowerShell
sudo apt-get update
sudo apt-get install -y powershell
# Install Git LFS
(. /etc/lsb-release && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo env os=ubuntu dist="${DISTRIB_CODENAME}" bash)
sudo apt-get update
sudo apt-get install git-lfs -y
# Install Homebrew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# No need to restart after Homebrew install

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# bash profile for Homebrew
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
# zsh env for Homebrew
test -r ~/.zshenv && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshenv
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zprofile
# Install npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# Install Node.js
nvm install --lts
nvm install node
nvm use node
# Update npm
npm update -g npm
# Update npm packages
npm i -g npm-check-updates && ncu -u && npm i
# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
# Install Docke Completions
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/zsh/docker -o /usr/share/zsh/vendor-completions/_docker
# Install kubectl
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
# Install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
rm -rf minikube_latest_amd64.deb
# Install kind
brew install kind
# Install argocd cli
brew install argocd
# Isstall age
apt install age -y
# TODO: ago keygen?
# Install mkcert and generate certs
brew install mkcert
mkcert -install
# Install k3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# Install k9s
brew install derailed/k9s/k9s
# Install kustomize
brew install kustomize
# Install skaaffold
brew install skaffold
# Install vcluster
brew install vcluster
popd || exit
# Ensure new package sources and packages are available
sudo apt update
sudo apt upgrade -y
sudo,file,wget,curl,git,openssl,ca-certificates,apt-transport-https,checkinstall,dos2unix,shellcheck,libnss3,libnss3-tools,build-essential,zlib1g-dev,gcc,postgresql-client,dotnet-sdk-6.0,dotnet-sdk-7.0,powerline,fonts-powerline,gedit,gimp,nautilus,vlc,x11-apps
sudo apt install -y gh git-lfs powershell dotnet-sdk-6.0 dotnet-sdk-7.0 kubectl minikube
brew upgrade #derailed/k9s/k9s kind argocd mkcert kustomize skaffold vcluster
../../devspace/setup/setup.sh
