#!/usr/bin/env bash
i="$0"
package="$1"
echo "$i: Starting installing node package: $package."
npm update -g npm
# https://stackoverflow.com/questions/33553082/how-can-i-update-all-npm-packages-modules-at-once
npm i -g npm-check-updates && ncu -u && npm i
npm install -g "$package"
echo "$i: Finished installing node package: $package."
