# PowerShell
# =========================================
# SharePoint QA Validation Script
# =========================================

param (
    [string]$siteUrl
)

Write-Output "========================================="
Write-Output "Starting QA Validation for: $siteUrl"
Write-Output "========================================="

try {
    # Validate site exists
    $site = Get-SPOSite -Identity $siteUrl -ErrorAction Stop
    Write-Output "PASS: Site exists"

    # Connect to site
    Connect-PnPOnline -Url $siteUrl -UseWebLogin

    # Validate document library
    $library = Get-PnPList -Identity "Documents" -ErrorAction Stop
    Write-Output "PASS: Document library exists"

    # Validate users
    $users = Get-PnPUser
    Write-Output "INFO: Users found: $($users.Count)"

    Write-Output "========================================="
    Write-Output "VALIDATION COMPLETE"
    Write-Output "========================================="

} catch {
    Write-Output "ERROR: Validation failed"
    Write-Output $_
}
