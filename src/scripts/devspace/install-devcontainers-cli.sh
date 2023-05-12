#!/usr/bin/env bash
# https://docs.docker.com/engine/reference/builder/#cmd
# https://docs.npmjs.com/getting-started/
# https://www.npmjs.com/package/@devcontainers/cli
echo "install-devcontainers-cli.sh: Starting."
npm update -g npm
npm install -g @devcontainers/cli
echo "install-devcontainers-cli.sh: Finished."
