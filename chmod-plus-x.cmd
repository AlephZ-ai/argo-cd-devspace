@ECHO OFF
setlocal
set script=%0
set scriptFolder=%~dp0
echo %script%: Starting.
rem https://stackoverflow.com/questions/74862849/powershell-convertto-securestring-not-recognised-if-run-script-inline-from-cmd
set "PSModulePath="
set KINDEST_ARGO_CD_PROJECT_ROOT=%scriptFolder%
PowerShell -file "%KINDEST_ARGO_CD_PROJECT_ROOT%/chmod-plus-x.ps1"
echo %script%: Finished.
endlocal
