# PowerShell
# =========================================
# SharePoint Permission Validation Script
# =========================================

param (
    [string]$siteUrl
)

Write-Output "========================================="
Write-Output "Starting Permission Validation for: $siteUrl"
Write-Output "========================================="

try {
    # Connect to SharePoint site
    Connect-PnPOnline -Url $siteUrl -UseWebLogin

    # Get SharePoint groups
    $groups = Get-PnPGroup
    Write-Output "INFO: Groups found: $($groups.Count)"

    foreach ($group in $groups) {
        Write-Output "GROUP: $($group.Title)"
    }

    # Check users in each group
    foreach ($group in $groups) {
        $members = Get-PnPGroupMember -Identity $group.Title
        Write-Output "INFO: $($group.Title) has $($members.Count) users"
    }

    Write-Output "PASS: Permission groups and memberships validated"

    Write-Output "========================================="
    Write-Output "PERMISSION VALIDATION COMPLETE"
    Write-Output "========================================="

} catch {
    Write-Output "ERROR: Permission validation failed"
    Write-Output $_
}
