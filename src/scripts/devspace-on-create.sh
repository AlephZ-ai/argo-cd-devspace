#!/usr/bin/env bash
# TODO: Make sure this script is idempotent since it will be run multiple times
argocdNamespace="argocd"
# https://docs.docker.com/engine/reference/builder/#cmd
# https://docs.npmjs.com/getting-started/
# https://www.npmjs.com/package/@devcontainers/cli
npm update -g npm
npm install -g @devcontainers/cli
# https://kind.sigs.k8s.io/docs/user/quick-start/
# https://cloud.google.com/anthos/clusters/docs/on-prem/latest/troubleshoot-user-cluster-create-api
# https://itnext.io/kubernetes-kind-cheat-shee-2605da77984
# existingCluster=$(kind get cluster default)
kind create cluster --wait 30s --config src/clusters/default.yaml
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/reference/kubectl/
kubectl config use-context kind-default
kubectl version --short
kubectl cluster-info
# https://helm.sh/docs/intro/quickstart/
# https://github.com/kubernetes/dashboard
# https://github.com/imorti/kind-dashboard-setup
# https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard
# https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
# https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard
# https://medium.com/@munza/local-kubernetes-with-kind-helm-dashboard-41152e4b3b3d
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
./src/scripts/create-kubernetes-devcert.sh $argocdNamespace $argocdNamespace-server-tls
./src/scripts/create-kubernetes-devcert.sh $argocdNamespace $argocdNamespace-repo-server-tls
./src/scripts/create-kubernetes-devcert.sh $argocdNamespace $argocdNamespace-dex-server-tls
# https://www.pcbaecker.com/posts/setup-argocd/
# https://medium.com/devopsturkiye/self-managed-argo-cd-app-of-everything-a226eb100cf0
# https://argo-cd.readthedocs.io/en/stable/getting_started/
# https://howchoo.com/kubernetes/read-kubernetes-secrets
argoSecret=argocd-initial-admin-secret
kubectl config set-context --current --namespace=argocd
helm install argocd ./src/argocd/ --create-namespace
echo "Waiting for argo password. CTRL-C to exit."
while ! (kubectl get secret $argoSecret 2>&1); do sleep 1; done
argopassword=$(kubectl get secret $argoSecret -o jsonpath="{.data.password}" | base64 --decode) 
argocd login --core localhost:5443 --username admin --password $argopassword
argocd account update-password --current-password $argopassword --new-password password
$argopassword=password
argocd login --core localhost:5443 --username admin --password $argopassword
kubectl port-forward svc/argocd-server -n argocd 7443:443 &
