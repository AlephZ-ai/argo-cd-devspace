@ECHO OFF
"$POWERSHELL_SHELL" -file "$SCRIPTS_ROOT/openssl/generate-root-ca.ps1"
"$POWERSHELL_SHELL" -file "$SCRIPTS_ROOT/argocd/generate-devcerts.ps1"
