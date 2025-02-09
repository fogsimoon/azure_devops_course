param(
    [Parameter(Mandatory = $false)]
    [object] $WebHookData
)

$Days = 30
$ConfirmDeletion = "N"

if ($WebHookData) {
    Write-Output "Received WebhookData:"
    $WebHookData | Format-List
    
    if ($WebhookData.RequestBody) {
    	try {
           $payload = ConvertFrom-Json -InputObject $WebHookData.RequestBody
        
           if ($payload.Days) {
               $Days = [int]$payload.Days
               Write-Output "Parsed Days: $Days"
           }
           if ($payload.ConfirmDeletion) {
               $ConfirmDeletion = $payload.ConfirmDeletion
               Write-Output "Parsed ConfirmDeletion: $ConfirmDeletion"
           }
        }
        catch {
            Write-Output "Failed to parse webhook payload. Error: $_"
       }
    }
    else {
        Write-Output "WebhookData.RequestBody is null"
    }
}
else {
    Write-Output "No WebhookData received"
}

Connect-AzAccount -Identity

$startDate = (Get-Date).AddDays(-$Days)

$allRGs = Get-AzResourceGroup

# Retrieve logs from the start date until now
$logs = Get-AzActivityLog -StartTime $startDate

# Extract the names of resource groups that have activity in the period
$usedRGs = $logs | Select-Object -ExpandProperty ResourceGroupName -Unique | Where-Object { $_ }

# Determine the resource groups that did not have any activity in the last $Days days
$unused = $allRGs | Where-Object { $usedRGs -notcontains $_.ResourceGroupName }

$unused | Select-Object ResourceGroupName, Location

# Delete unused resource groups if confirmed
if ($unused.Count -gt 0) {
    if ($ConfirmDeletion -eq "Y" -or $ConfirmDeletion -eq "y") {
        foreach ($rg in $unused) {
            Write-Output "Deleting resource group: $($rg.ResourceGroupName)..."
            Remove-AzResourceGroup -Name $rg.ResourceGroupName -Force -Confirm:$false
        }
        Write-Output "Deletion complete"
    }
    else {
        Write-Output "Deletion canceled by user"
    }
}
else {
    Write-Output "No unused resource groups found"
    
    
}

