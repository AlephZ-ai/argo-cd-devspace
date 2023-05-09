# https://docs.npmjs.com/getting-started/
# https://www.npmjs.com/package/@devcontainers/cli
npm install -g @devcontainers/cli
# https://kind.sigs.k8s.io/docs/user/quick-start/
kind create cluster --config clusters/default.yaml
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
# kubectl create -n argocd secret tls argocd-server-tls \
#   --cert=cert.pem \
#   --key=key.pem
# kubectl create -n argocd secret tls argocd-repo-server-tls \
#   --cert=cert.pem \
#   --key=key.pem
# kubectl create -n argocd secret tls argocd-dex-server-tls \
#   --cert=cert.pem \
#   --key=key.pem
# https://github.com/kubernetes/dashboard
# https://github.com/imorti/kind-dashboard-setup
# https://helm.sh/docs/intro/quickstart/
