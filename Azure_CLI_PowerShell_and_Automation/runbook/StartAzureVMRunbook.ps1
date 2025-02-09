param(
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]$VMName
)


try
{
    Connect-AzAccount -Identity

    Write-Output "Starting VM '$VMName' in resource group '$ResourceGroupName'..."
    Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
    Write-Output "VM started successfully!"
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}

