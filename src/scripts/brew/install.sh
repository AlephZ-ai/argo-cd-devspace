#!/usr/bin/env bash
brew=$1
brew update
brew upgrade
brew install "$brew"
