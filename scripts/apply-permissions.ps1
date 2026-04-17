param(
    [string]$SitePath,
    [string]$PermissionsTemplatePath,
    [string]$MetadataTemplatePath,
    [string]$LogPath
)

$permissions = Get-Content $PermissionsTemplatePath | ConvertFrom-Json
$metadata = Get-Content $MetadataTemplatePath | ConvertFrom-Json

$permissionsOutputPath = Join-Path $SitePath "permissions.json"
$metadataOutputPath = Join-Path $SitePath "metadata.json"

$permissions | ConvertTo-Json -Depth 5 | Set-Content $permissionsOutputPath
$metadata | ConvertTo-Json -Depth 5 | Set-Content $metadataOutputPath

& "$PSScriptRoot/write-log.ps1" -LogPath $LogPath -Message "Applied mock permissions"
& "$PSScriptRoot/write-log.ps1" -LogPath $LogPath -Message "Applied metadata schema"
