@ECHO OFF
call "$PROJECT_ROOT/chmod-plus-x"
"$POWERSHELL_SHELL" -file "$SCRIPTS_ROOT/devspace/test.ps1"
