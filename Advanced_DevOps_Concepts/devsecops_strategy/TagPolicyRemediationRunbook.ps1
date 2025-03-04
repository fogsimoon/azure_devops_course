param (
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroup,
    
    [Parameter(Mandatory=$true)]
    [string]$PolicyAssignmentName
)

Write-Output "ResourceGroup: $ResourceGroup"
Write-Output "PolicyAssignmentName: $PolicyAssignmentName"

Connect-AzAccount -Identity
try {
    $tagNonCompliantStates = Get-AzPolicyState -ResourceGroupName $ResourceGroup -PolicyAssignmentName $PolicyAssignmentName | Where-Object { $_.ComplianceState -eq "NonCompliant" }
    Write-Output "Found $($tagNonCompliantStates.Count) tag policy noncompliant resources."
}
catch {
    Write-Error "Failed to retrieve resource with policy assignment $PolicyAssignmentName. Error: $_"
    return
}

if ($tagNonCompliantStates) {
    foreach ($state in $tagNonCompliantStates) {
        $resourceId   = $state.ResourceId
        $resourceType = $state.ResourceType
        $policyName   = $state.PolicyAssignmentName

        $resIdParts = $resourceId -split '/'
        $subId       = $resIdParts[2]
        $rgName      = $resIdParts[4]
        $acctName    = $resIdParts[8]
    
        Write-Output "Processing storage account $acctName in resourceGroup $rgName"

        try {
            $storageAccount = Get-AzStorageAccount -ResourceGroupName $rgName -Name $acctName -ErrorAction Stop

            $requiredTagKey   = "environment"
            $requiredTagValue = "dev"
            $currentTags      = $storageAccount.Tags

            if (-not $currentTags.ContainsKey($requiredTagKey)) {
                Write-Output "Adding missing tag: '$requiredTagKey=$requiredTagValue'"
                $currentTags[$requiredTagKey] = $requiredTagValue

                Set-AzStorageAccount `
                    -Name $acctName `
                    -ResourceGroupName $rgName `
                    -Tag $currentTags `
                    -ErrorAction Stop

                Write-Output "Tag '$requiredTagKey' applied successfully."
            }
        }
        catch {
            Write-Error "Failed to remediate storage account $resourceId. Error: $_"
        }
    }
} else {
     Write-Output "No noncompliant resources found or unable to retrieve policy states."
}
