param(
    [string]$SitePath,
    [string]$LibrariesTemplatePath,
    [string]$LogPath
)

$librariesTemplate = Get-Content $LibrariesTemplatePath | ConvertFrom-Json

foreach ($library in $librariesTemplate.libraries) {
    $libraryPath = Join-Path $SitePath $library

    if (-not (Test-Path $libraryPath)) {
        New-Item -Path $libraryPath -ItemType Directory | Out-Null
        & "$PSScriptRoot/write-log.ps1" -LogPath $LogPath -Message "Created library: $library"
    }
}
