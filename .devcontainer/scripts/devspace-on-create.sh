#!/bin/sh
# TODO: Make sure this script is idempotent since it will be run multiple times
# https://kind.sigs.k8s.io/docs/user/quick-start/
kind create cluster --config /home/vscode/.devcontainer/clusters/default.yaml
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/reference/kubectl/
kubectl config use-context kind-default
kubectl version --short
kubectl cluster-info
# https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
# https://argo-cd.readthedocs.io/en/stable/getting_started
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/
~/scripts/create-kubernetes-devcert.sh argocd argocd-server-tls argocd-server-tls-password
~/scripts/create-kubernetes-devcert.sh argocd argocd-repo-server-tls argocd-repo-server-tls-password
~/scripts/create-kubernetes-devcert.sh argocd argocd-dex-server-tls argocd-dex-server-tls-password
# https://github.com/kubernetes/dashboard
# https://github.com/imorti/kind-dashboard-setup
# https://helm.sh/docs/intro/quickstart/
