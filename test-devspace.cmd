@ECHO OFF
PROJECT_ROOT="%~dp0"
SCRIPTS_ROOT="$PROJECT_ROOT/src/scripts"
call "$PROJECT_ROOT/chmod-plus-x"
"$PSHELL" -file "$SCRIPTS_ROOT/devspace/test.ps1"
