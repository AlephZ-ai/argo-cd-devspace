#!/usr/bin/env bash
module="$1"
pwsh -command Install-Module "$module" -Force -AcceptLicense    
