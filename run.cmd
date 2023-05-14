@ECHO OFF
setlocal
set projectRoot=%~dp0
set script=%1
rem https://stackoverflow.com/questions/74862849/powershell-convertto-securestring-not-recognised-if-run-script-inline-from-cmd
set "PSModulePath="
PowerShell -file "%projectRoot%/run.ps1" --script "%script%"
endlocal
