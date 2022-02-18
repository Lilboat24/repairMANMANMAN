#Creating a NIC for a VM
$vnet= Get-AzVirtualNetwork -Name "vnet-DMZ-azureland-dev-eastus-001" -ResourceGroupName "rg-azureland-caelus-dev-eastus-001"
$subnet_id = ($vnet.Subnets | Where-Object{$_.Name -eq "snet-DMZ-generalA-azureland-dev-eastus-001"}).id

$NicName = "BrittzVM1-nic"
$pipName = "BrittzVM1-PIP"
$rgName = "rg-azureland-caelus-dev-eastus-001"
$rgLocation = "eastus"
$ipConfigName = "Brittany"

$nic = @{
    Name = $NicName
    ResourceGroupName = $rgName
    Location = $rgLocation
    SubnetId = $subnet_id
    IpConfigurationName = $ipConfigName


}
New-AzNetworkInterface @nic
