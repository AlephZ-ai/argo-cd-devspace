#!/usr/bin/env bash
#shellcheck disable=SC2009
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
namespace=argocd
echo "Waiting for $namespace-server to be ready. CTRL-C to exit."
kubectl wait \
   --for=condition=ready pod \
   --selector=app.kubernetes.io/name=$namespace-server \
   --timeout=30s
existingForward=$(ps -ef | grep port-forward | grep 17443)
if [ "$existingForward" != "" ]; then
    echo "Forward already exists. Killing."
    pkill kubectl -9
fi
(kubectl port-forward svc/argocd-server 17443:443 2>&1) &
sleep 1s
