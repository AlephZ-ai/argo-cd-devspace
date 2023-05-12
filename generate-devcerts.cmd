@ECHO OFF
SCRIPTS_ROOT="%~dp0/src/scripts"
"$PSHELL" -file "$SCRIPTS_ROOT/openssl/generate-root-ca.ps1"
"$PSHELL" -file "$SCRIPTS_ROOT/argocd/generate-devcerts.ps1"
