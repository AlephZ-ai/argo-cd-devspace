#!/usr/bin/env zsh
#shellcheck shell=bash
module="$1"
pwsh -command Install-Module "$module" -Force -AcceptLicense    
