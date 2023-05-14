#!/usr/bin/env bash
i="$0"
module="$1"
echo "$i: Started installing PowerShell module: $module."
pwsh -command Install-Module "$module" -Force -AcceptLicense    
echo "$i: Finished installing PowerShell module: $module."
