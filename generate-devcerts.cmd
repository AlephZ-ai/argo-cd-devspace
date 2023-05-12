@ECHO OFF
powershell -command "./src/scripts/openssl/generate-root-ca.ps1"
powershell -command "./src/scripts/argocd/generate-devcerts.ps1"
