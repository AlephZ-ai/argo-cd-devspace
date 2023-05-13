@ECHO OFF
setlocal
set script=%0
set scriptFolder=%~dp0
echo %script%: Starting.
set SCRIPTS_ROOT=%scriptFolder%/src/scripts
%pshell% -file "%SCRIPTS_ROOT%/openssl/generate-root-ca.ps1"
%pshell% -file "%SCRIPTS_ROOT%/argocd/generate-devcerts.ps1"
echo %script%: Finished.
endlocal
