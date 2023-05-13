@ECHO OFF
setlocal
set script=%0
set scriptFolder=%~dp0
echo "%script%: Starting."
set PROJECT_ROOT="%scriptFolder%"
set SCRIPTS_ROOT="%PROJECT_ROOT%/src/scripts"
call "%$PROJECT_ROOT%/chmod-plus-x"
pshell -file "%SCRIPTS_ROOT%/devspace/test.ps1"
echo "%script%: Finished."
endlocal
