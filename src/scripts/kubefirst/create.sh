#!/usr/bin/env bash
while ! (bash -c "kubefirst k3d create"); do echo "Retrying Create Kubefirst Cluster"; sleep 1s; done
