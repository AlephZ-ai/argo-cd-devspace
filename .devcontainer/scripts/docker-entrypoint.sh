#!/bin/sh
# https://docs.docker.com/engine/reference/builder/#entrypoint
# set defaults
set -e

# return control
exec "$@"
