@ECHO OFF
set SCRIPTS_ROOT="%~dp0/src/scripts"
pshell -file "%SCRIPTS_ROOT%/openssl/generate-root-ca.ps1"
pshell -file "%SCRIPTS_ROOT%/argocd/generate-devcerts.ps1"
