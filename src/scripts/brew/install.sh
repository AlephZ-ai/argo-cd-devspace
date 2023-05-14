#!/usr/bin/env zsh
#shellcheck shell=bash
brew="$1"
brew update
brew upgrade
brew install "$brew"
