#!/usr/bin/env bash
# TODO: Make sure this script is idempotent since it will be run multiple times
# https://docs.docker.com/engine/reference/builder/#cmd
# https://docs.npmjs.com/getting-started/
# https://www.npmjs.com/package/@devcontainers/cli
npm update -g npm
npm install -g @devcontainers/cli
