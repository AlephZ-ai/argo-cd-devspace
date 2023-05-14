#!/usr/bin/env bash
i="$0"
brew=$1
echo "$i: Started Installing brew: $brew."
brew update
brew upgrade
brew install "$brew"
echo "$i: Finished Installing brew: $brew."
