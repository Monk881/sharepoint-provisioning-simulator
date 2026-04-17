param(
    [string]$LogPath,
    [string]$Message
)

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$entry = "$timestamp - $Message"
Add-Content -Path $LogPath -Value $entry
