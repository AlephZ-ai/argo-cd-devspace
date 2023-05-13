#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$(dirname "$scriptPath")")"
script="$scriptPath/$script"
echo "$script: Starting."
rm -f nohup.out
"$scriptsPath/devspace/setup/set-env-vars.sh"
"$scriptsPath/devspace/setup/setup-zshrc.sh"
# TODO: Why does this break things?
# git config --global --add safe.directory /workspaces/$PROJECT
"$scriptsPath/devspace/setup/install-devcontainers-cli.sh"
"$scriptsPath/git/install-git-credential-manager.sh"
"$scriptsPath/npm/install.sh" "dotenv-cli"
"$scriptsPath/pwsh/install-module.sh" "Set-PsEnv"
"$scriptsPath/pwsh/install-module.sh" "Pester"
"$scriptsPath/kind/create-kindest-cluster.sh"
# https://helm.sh/docs/intro/quickstart/
# https://github.com/kubernetes/dashboard
# https://github.com/imorti/kind-dashboard-setup
# https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard
# https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
# https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard
# helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
# helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard
# https://medium.com/@munza/local-kubernetes-with-kind-helm-dashboard-41152e4b3b3d
# https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
# kubectl wait --namespace ingress-nginx \
#   --for=condition=ready pod \
#   --selector=app.kubernetes.io/component=controller \
#   --timeout=90s
"$scriptsPath/argocd/install.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "$script: Finished."
