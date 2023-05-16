#shellcheck shell=bash
#shellcheck source=/dev/null
#shellcheck disable=SC2016
touch ~/.bash_profile
# Update the list of packages
sudo apt-get update
# Upgrade any packages available
sudo ap-get upgrade -y
# Install pre-requisite packages.
sudo apt install -y --fix-missing bzip2 sudo fonts-dejavu-core g++ git less libz-dev locales openssl make netbase openssh-client patch tzdata uuid-runtime apt-transport-https ca-certificates speedtest-cli checkinstall dos2unix shellcheck file wget curl zsh procps software-properties-common libnss3 libnss3-tools build-essential zlib1g-dev gcc bash-completion age postgresql-client powerline fonts-powerline gedit gimp nautilus vlc x11-apps
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
touch ~/.zshenv
touch ~/.zprofile
# Get Ubuntu version
repo_version="$(lsb_release -r -s)"
# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/$repo_version/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
# Install Microsoft signing key and repository
sudo dpkg -i /tmp/packages-microsoft-prod.deb
sudo apt-get update
# Clean up
rm -rf /tmp/packages-microsoft-prod.deb
# Install Dotnet SDK versions
sudo apt install dotnet-sdk-6.0 dotnet-sdk-7.0 -y
wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh
chmod +x /tmp/dotnet-install.sh
/tmp/dotnet-install.sh --channel 6.0 --version latest
rm -rf /tmp/dotnet-install.sh
dotnet --version
# Install PowerShell
sudo apt-get install -y powershell
pwsh --version
# Install Git LFS
(. /etc/lsb-release && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo env os=ubuntu dist="${DISTRIB_CODENAME}" bash)
sudo apt-get update
sudo apt-get install git-lfs -y
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
# No need to restart after nvm install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm version
# TODO: update ~/.bashrc the above script is only updating ~/.zshrc
# Install Node.js
nvm install --lts
nvm install node
nvm use node
node --version
# Update npm
npm update -g npm
npm --version
npm version
# Update npm packages
npm i -g npm-check-updates && ncu -u && npm i
# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
gh --version
# Install Docker Completions
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/zsh/docker -o /usr/share/zsh/vendor-completions/_docker
docker --version
docker-compose --version
# Install kubectl
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
kubectl version --short --client
# Install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
# Install minikube
curl https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb -o /tmp/minikube_latest_amd64.deb
sudo dpkg -i /tmp/minikube_latest_amd64.deb
rm -rf /tmp/minikube_latest_amd64.deb
minikube version
# Install kind
brew install kind
kind version
# Install argocd cli
brew install argocd
argocd version --client
# Isstall age
sudo apt install age -y
age --version
age-keygen --version
# Install mkcert and generate certs
brew install mkcert
mkcert --version
mkcert -install
# Install k3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d version
# Install k9s
brew install derailed/k9s/k9s
k9s version
# Install kustomize
brew install kustomize
kustomize version
# Install skaaffold
brew install skaffold
skaffold version
# Install vcluster
brew install vcluster
vcluster version
# Ensure new package sources and packages are available
sudo apt update
sudo apt upgrade -y
sudo apt install -y gh git-lfs powershell dotnet-sdk-6.0 dotnet-sdk-7.0 kubectl minikube age
brew upgrade #derailed/k9s/k9s kind argocd mkcert kustomize skaffold vcluster
# Cleanup
sudo apt autoclean -y
sudo apt autoremove -y
# Log into GitHub
if ! gh auth status; then gh auth login; fi
gh config set -h github.com git_protocol https
