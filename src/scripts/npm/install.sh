#!/usr/bin/env zsh
#shellcheck shell=bash
package="$1"
npm update -g npm
# https://stackoverflow.com/questions/33553082/how-can-i-update-all-npm-packages-modules-at-once
npm i -g npm-check-updates && ncu -u && npm i
npm install -g "$package"
