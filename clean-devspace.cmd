@ECHO OFF
setlocal
set script=%0
set scriptFolder=%~dp0
echo %script%: Starting.
rem https://stackoverflow.com/questions/74862849/powershell-convertto-securestring-not-recognised-if-run-script-inline-from-cmd
set PROJECT_ROOT=%scriptFolder%
PowerShell -file "%PROJECT_ROOT%/clean-devspace.ps1"
echo %script%: Finished.
endlocal
