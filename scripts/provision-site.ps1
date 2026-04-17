$projectRoot = Split-Path -Parent $PSScriptRoot
$inputPath = Join-Path $projectRoot "input/site-request.json"
$librariesTemplatePath = Join-Path $projectRoot "templates/libraries.json"
$permissionsTemplatePath = Join-Path $projectRoot "templates/permissions.json"
$metadataTemplatePath = Join-Path $projectRoot "templates/metadata.json"
$outputRoot = Join-Path $projectRoot "output"

if (-not (Test-Path $outputRoot)) {
    New-Item -Path $outputRoot -ItemType Directory | Out-Null
}

$request = Get-Content $inputPath | ConvertFrom-Json
$sitePath = Join-Path $outputRoot $request.siteName

if (-not (Test-Path $sitePath)) {
    New-Item -Path $sitePath -ItemType Directory | Out-Null
}

$siteInfo = @{
    siteName    = $request.siteName
    owner       = $request.owner
    department  = $request.department
    siteType    = $request.siteType
    description = $request.description
    provisioned = (Get-Date).ToString("s")
}

$siteInfoPath = Join-Path $sitePath "site-info.json"
$logPath = Join-Path $sitePath "provisioning.log"

$siteInfo | ConvertTo-Json -Depth 5 | Set-Content $siteInfoPath

& "$PSScriptRoot/write-log.ps1" -LogPath $logPath -Message "Provisioning started for site: $($request.siteName)"
& "$PSScriptRoot/write-log.ps1" -LogPath $logPath -Message "Owner: $($request.owner)"
& "$PSScriptRoot/write-log.ps1" -LogPath $logPath -Message "Department: $($request.department)"
& "$PSScriptRoot/write-log.ps1" -LogPath $logPath -Message "Site type: $($request.siteType)"

& "$PSScriptRoot/configure-libraries.ps1" `
    -SitePath $sitePath `
    -LibrariesTemplatePath $librariesTemplatePath `
    -LogPath $logPath

& "$PSScriptRoot/apply-permissions.ps1" `
    -SitePath $sitePath `
    -PermissionsTemplatePath $permissionsTemplatePath `
    -MetadataTemplatePath $metadataTemplatePath `
    -LogPath $logPath

& "$PSScriptRoot/write-log.ps1" -LogPath $logPath -Message "Provisioning completed successfully"

Write-Host "Provisioning completed. Review output in: $sitePath"
