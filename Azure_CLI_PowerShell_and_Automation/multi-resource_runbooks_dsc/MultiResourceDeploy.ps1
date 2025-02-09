# Connect to Azure
Connect-AzAccount -Identity

$ResourceGroup = "YuliiaHrabovenko"
$Location = "CentralUS"
$VMName = "WebServerVM"
$VMSize = "Standard_B1s"
$ImageSku = "2019-Datacenter"
$AdminUser = "azureuser"
$AdminPassword = "theri891wEqpiHgd" | ConvertTo-SecureString -AsPlainText -Force
$VNetName = "WebVNet"
$SubnetName = "WebSubnet"
$PublicIPName = "WebServerPublicIP"
$NICName = "WebServerNIC"
$NSGName = "WebServerNSG"
$RuleName = "Allow-HTTP"
$RuleName1 = "Allow-RDP"
$DiskName = "WebServerDisk"
$DiskSizeGB = 10
$VnetAddressPrefix = "10.0.0.0/16"
$SubnetAddressPrefix = "10.0.0.0/24"
$StorageAccountName = "storage789012"
$ContainerName = "dscscripts"

# Create Storage Account
Write-Output "Creating Storage Account..."
New-AzStorageAccount -ResourceGroupName $ResourceGroup `
    -Name $StorageAccountName `
    -SkuName "Standard_LRS" `
    -Location $Location `
    -Kind "StorageV2" `
    -MinimumTlsVersion TLS1_2

$StorageContext = New-AzStorageContext -StorageAccountName $StorageAccountName -UseConnectedAccount

Write-Output "Creating Container for DSC Scripts..."
New-AzStorageContainer -Name $ContainerName -Context $StorageContext

Write-Output "Creating Virtual Network and Subnet..."
$SubnetConfig = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix
$VNet = New-AzVirtualNetwork -ResourceGroupName $ResourceGroup -Location $Location -Name $VNetName -AddressPrefix $VnetAddressPrefix -Subnet $SubnetConfig

Write-Output "Creating Public IP..."
$PublicIP = New-AzPublicIpAddress -ResourceGroupName $ResourceGroup -Location $Location -Name $PublicIPName -AllocationMethod Static

Write-Output "Creating Network Security Group..."
$NSG = New-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroup -Location $Location -Name $NSGName

Write-Output "Adding NSG Rule for Port 80..."
$Rule = Add-AzNetworkSecurityRuleConfig -NetworkSecurityGroup $NSG `
    -Name $RuleName `
    -Priority 100 `
    -Direction Inbound `
    -Access Allow `
    -Protocol Tcp `
    -SourceAddressPrefix * `
    -SourcePortRange * `
    -DestinationAddressPrefix * `
    -DestinationPortRange 80 `
    -Description "Allow inbound HTTP traffic"

Write-Output "Adding NSG Rule for Port 3389..."    
$Rule = Add-AzNetworkSecurityRuleConfig -NetworkSecurityGroup $NSG `
        -Name $RuleName1 `
        -Priority 110 `
        -Direction Inbound `
        -Access Allow `
        -Protocol Tcp `
        -SourceAddressPrefix * `
        -SourcePortRange * `
        -DestinationAddressPrefix * `
        -DestinationPortRange 3389 `
        -Description "Allow inbound RDP traffic"

Set-AzNetworkSecurityGroup -NetworkSecurityGroup $NSG

Write-Output "Creating Network Interface and Attach NSG..."
$NIC = New-AzNetworkInterface -ResourceGroupName $ResourceGroup -Location $Location -Name $NICName -SubnetId $VNet.Subnets[0].Id -PublicIpAddressId $PublicIP.Id -NetworkSecurityGroupId $NSG.Id

Write-Output "Creating VM Configuration..."
$Credential = New-Object System.Management.Automation.PSCredential ($AdminUser, $AdminPassword)
$VMConfig = New-AzVMConfig -VMName $VMName -VMSize $VMSize
$VMConfig = Set-AzVMOperatingSystem -VM $VMConfig -Windows -ComputerName $VMName -Credential $Credential
$VMConfig = Set-AzVMSourceImage -VM $VMConfig -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus $ImageSku -Version "latest"
$VMConfig = Add-AzVMNetworkInterface -VM $VMConfig -Id $NIC.Id
$VMConfig = Set-AzVMBootDiagnostic -VM $VMConfig -Disable

Write-Output "Creating VM: $VMName..."
New-AzVM -ResourceGroupName $ResourceGroup -Location $Location -VM $VMConfig

Write-Output "Creating Managed Disk..."
$DiskConfig = New-AzDiskConfig -SkuName "Standard_LRS" -Location $Location -CreateOption "Empty" -DiskSizeGB $DiskSizeGB
$Disk = New-AzDisk -ResourceGroupName $ResourceGroup -DiskName $DiskName -Disk $DiskConfig

Write-Output "Attaching Managed Disk to VM..."
$VM = Get-AzVM -ResourceGroupName $ResourceGroup -Name $VMName
Add-AzVMDataDisk -VM $VM -Name $DiskName -CreateOption Attach -ManagedDiskId $Disk.Id -Lun 0
Update-AzVM -ResourceGroupName $ResourceGroup -VM $VM

Write-Output "Deploying DSC Configuration..."
$DSCConfig = @"
Configuration InstallIIS {
    Node "localhost" {
    
        # Install IIS Web Server
        WindowsFeature IIS {
            Name   = "Web-Server"
            Ensure = "Present"
        }

        # Ensure Website Directory Exists
        File WebsiteFolder {
            DestinationPath = "C:\inetpub\wwwroot"
            Type   = "Directory"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]IIS"
        }

        # Replace Default IIS Page with Custom HTML
        File CustomIndexPage {
            DestinationPath = "C:\inetpub\wwwroot\index.html"
            Contents = @'
<!DOCTYPE html>
<html>
<head>
    <title>Custom IIS Page</title>
</head>
<body>
    <h1>Welcome to IIS Web Server!</h1>
    <p>This page was deployed using DSC.</p>
</body>
</html>
'@
            Ensure    = "Present"
            Type      = "File"
            DependsOn = "[File]WebsiteFolder"
        }

        # Ensure IIS Service is Running
        Service IISService {
            Name      = "w3svc"
            Ensure    = "Present"
            State     = "Running"
            DependsOn = "[WindowsFeature]IIS"
        }
    }
}
"@

$DSCConfig | Set-Content -Path InstallIIS.ps1

Write-Output "Publish DSC Configuration..."
Publish-AzVMDscConfiguration -ResourceGroupName $ResourceGroup `
    -ConfigurationPath ".\InstallIIS.ps1" `
    -StorageAccountName $StorageAccountName `
    -ContainerName $ContainerName `
    -Force


Write-Output "Apply DSC Extension..."
Set-AzVMDscExtension -ResourceGroupName $ResourceGroup `
    -VMName $VMName `
    -ArchiveBlobName InstallIIS.ps1.zip `
    -ArchiveContainerName $ContainerName `
    -ArchiveStorageAccountName $StorageAccountName `
    -ConfigurationName "InstallIIS" `
    -Version "2.83" `
    -AutoUpdate `
    -Force
    

$PublicIP = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroup -Name $PublicIPName
Write-Output "Web Server deployed! Access it via: http://$($PublicIP.IpAddress)"

