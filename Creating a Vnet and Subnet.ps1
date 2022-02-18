#Create a Hub Virtual Network (Vnet) Subnet and NIC Resources
#Variables
$hvnName = "brittHub-vNET"
$rgName = "BrittanyTestRG"
$rgLocation = "East US"
$hvnAddressPrefix = "192.168.0.0/16"


$hvn = @{
    Name = $hvnName
    ResourceGroupName = $rgName
    AddressPrefix = $hvnAddressPrefix
    Location = $rgLocation
    
}
$virtualNetwork= New-AzVirtualNetwork @hvn


#Create a Frontend Subnet
#Variables
$subName = "brittHubFrontEndSubnet"
$subAddressPrefix = "192.168.1.0/24"
$hvnName = "brittHub-vNET"

$sub = @{
    Name = $subName
    AddressPrefix = $subAddressPrefix
    VirtualNetwork = $virtualNetwork
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @sub

# Assign Front end subnet to Virtual Network

$virtualNetwork| Set-AzVirtualNetwork
