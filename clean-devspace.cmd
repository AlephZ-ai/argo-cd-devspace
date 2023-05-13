@ECHO OFF
set SCRIPTS_ROOT="%~dp0/src/scripts"
pshell -file "%SCRIPTS_ROOT%/devspace/clean.ps1"
