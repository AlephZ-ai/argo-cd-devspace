@ECHO OFF
set PROJECT_ROOT="%~dp0"
set SCRIPTS_ROOT="%PROJECT_ROOT%/src/scripts"
call "%$PROJECT_ROOT%/chmod-plus-x"
pshell -file "%SCRIPTS_ROOT%/devspace/test.ps1"
