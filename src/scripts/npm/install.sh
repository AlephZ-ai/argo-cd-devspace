#!/usr/bin/env bash
# https://docs.npmjs.com/getting-started/
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
package=$1
npm update -g npm
# https://stackoverflow.com/questions/33553082/how-can-i-update-all-npm-packages-modules-at-once
npm i -g npm-check-updates && ncu -u && npm i
npm install -g "$package"
echo "$script: Finished."
