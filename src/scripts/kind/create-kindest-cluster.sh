#!/usr/bin/env bash
# https://kind.sigs.k8s.io/docs/user/quick-start/
# https://cloud.google.com/anthos/clusters/docs/on-prem/latest/troubleshoot-user-cluster-create-api
# https://itnext.io/kubernetes-kind-cheat-shee-2605da77984
name=kindest
while ! (kind create cluster --wait 30s --config src/clusters/$name.yaml 2>&1); do kind delete clusters $name; done
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/reference/kubectl/
kubectl config use-context kind-$name
kubectl version --short
kubectl cluster-info
