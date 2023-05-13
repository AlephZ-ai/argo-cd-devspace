$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    $root="root"
    $certpurpose=$root
    $password="$root-password"
    $subject="/C=US/CN=Dev-Root-CA"
    if (!(Test-Path -Path "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose")) {
        New-Item -Force -ItemType File "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose"
    }

    openssl req -x509 -nodes -new -sha256 -days 3650 -newkey rsa:2048 -keyout "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.key" -out "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pem" -subj $subject
    openssl x509 -outform pem -in "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pem" -out "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.crt"
    # https://stackoverflow.com/questions/808669/convert-a-cert-pem-certificate-to-a-pfx-certificate
    # https://stackoverflow.com/questions/63441247/how-to-pass-pkcs12-password-into-openssl-conversion-module
    openssl pkcs12 -passout pass:$password -inkey "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.key" -in "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.crt" -export -out "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
    git add -f "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
    Write-Host "${script}: Finished."
}
