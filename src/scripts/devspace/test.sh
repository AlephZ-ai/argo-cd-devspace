#!/usr/bin/env bash
./src/scripts/utils/chmod-plus-x.sh
./src/scripts/devspace/build.sh
# TODO: Add Test
./src/scripts/devspace/clean.sh
