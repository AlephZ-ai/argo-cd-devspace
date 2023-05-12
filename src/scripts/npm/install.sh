#!/usr/bin/env bash
# https://docs.npmjs.com/getting-started/
script=$0
package=$1
echo "$script: Starting."
npm update -g npm
# https://stackoverflow.com/questions/33553082/how-can-i-update-all-npm-packages-modules-at-once
npm i -g npm-check-updates && ncu -u && npm i
npm install -g "$package"
echo "$script: Finished."
