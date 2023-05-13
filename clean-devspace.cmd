@ECHO OFF
setlocal
set script=%0
set scriptFolder=%~dp0
echo "%script%: Starting."
set SCRIPTS_ROOT="%scriptFolder%/src/scripts"
pshell -file "%SCRIPTS_ROOT%/devspace/clean.ps1"
echo "%script%: Finished."
endlocal
