@ECHO OFF
@REM set script=%0
@REM set scriptPath=%~dp0
@REM set pshell=%1
@REM echo "%script%: Starting."
@REM if %KINDEST_ARGO_CD_ENV_SETUP_COMPLETE%=="true" (
@REM     rem Environment setup already complete.
@REM     rem Don't log this it would be too noisy.
@REM     exit /b
@REM )

@REM set PROJECT_ROOT="%scriptPath%\..\..\..\.."
@REM for %%i in ("%PROJECT_ROOT%") do set "PROJECT_ROOT=%%~fi"
@REM set SCRIPTS_ROOT="%PROJECT_ROOT%/src/scripts"
@REM set KINDEST_ARGO_CD_REPO_URL="https://github.com/AlephZ-ai/kindest-argo-cd.git"
@REM set KINDEST_ARGO_CD_CLUSTER_NAME="kindest"
@REM set KINDEST_ARGO_CD_KUBE_PORT="10443"
@REM set KINDEST_ARGO_CD_ARGO_PORT="11443"
@REM set KINDEST_ARGO_CD_ARGO_PASSWORD="password"
@REM set KINDEST_ARGO_CD_ARGO_NAME="argocd"
@REM set KINDEST_ARGO_CD_ARGO_NAMESPACE="argocd"
@REM set KINDEST_ARGO_CD_ARGO_PROJECT="default"
@REM set KINDEST_ARGO_CD_ENV_SETUP_COMPLETE="true"
@REM echo "%script%: Environment variables set."
@REM echo "%script%: Finished."
