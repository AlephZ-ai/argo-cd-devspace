# https://www.npmjs.com/package/@devcontainers/cli
npm install -g @devcontainers/cli
# https://kind.sigs.k8s.io/docs/user/quick-start/
kind create cluster --config clusters/default.yaml
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
kubectl config use-context kind-default
kubectl version --short
kubectl cluster-info
# https://argo-cd.readthedocs.io/en/stable/getting_started
# https://github.com/kubernetes/dashboard
# https://github.com/imorti/kind-dashboard-setup
# https://helm.sh/docs/intro/quickstart/
