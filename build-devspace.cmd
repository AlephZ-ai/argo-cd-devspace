@ECHO OFF
SCRIPTS_ROOT="%~dp0/src/scripts"
"$PSHELL" -file "$SCRIPTS_ROOT/devspace/build.ps1"
