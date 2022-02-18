#Creating a Public IP

$NicName = "BrittzVM1-nic"
$pipName = "BrittzVM1-PIP"
$rgName = "rg-azureland-caelus-dev-eastus-001"
$rgLocation = "eastus"
$allMeth = "Static"
$sku = "Standard"
$ipAddyVer = "IPv4"

$pip = @{
    Name = $pipName
    ResourceGroupName = $rgName
    Location = $rgLocation
    AllocationMethod = $allMeth
    Sku = $sku
    IpAddressVersion = $ipAddyVer
    

}
New-AzPublicIpAddress @pip