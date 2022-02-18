#Creating a Hub and Two Spoke Network Infracturcture ####

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


#Create Spoke A VNet Subnet and NIC Resources
#Variables
$spkAName = "brittSpokeA-vNET"
$rgName = "BrittanyTestRG"
$rgLocation = "East US"
$spkAAddressPrefix = "192.168.0.0/16"


$spkA = @{
    Name = $spkAName
    ResourceGroupName = $rgName
    AddressPrefix = $spkAAddressPrefix
    Location = $rgLocation
    
}
$spokeAvirtualNetwork = New-AzVirtualNetwork @spkA

#Subnet
$subskAName = "brittSpokeAFrontEndSubnet"
$subskAAddressPrefix = "192.168.2.0/24"
$spkAName = "brittSpokeA-vNET"

$subskA = @{
    Name = $subskAName
    AddressPrefix = $subskAAddressPrefix
    VirtualNetwork = $spokeAvirtualNetwork
}
Add-AzVirtualNetworkSubnetConfig @subskA

# Assign Front end subnet to Virtual Network
$spokeAvirtualNetwork | Set-AzVirtualNetwork

#Create Spoke B VNet Subnet and NIC Resources
#Variables
$spkBName = "brittSpokeB-vNET"
$rgName = "BrittanyTestRG"
$rgLocation = "East US"
$spkBAddressPrefix = "192.168.0.0/16"


$spkB = @{
    Name = $spkBName
    ResourceGroupName = $rgName
    AddressPrefix = $spkBAddressPrefix
    Location = $rgLocation
    
}
$spokeBvirtualNetwork = New-AzVirtualNetwork @spkB

#Subnet
$subskBName = "brittSpokeBFrontEndSubnet"
$subskBAddressPrefix = "192.168.2.0/24"
$spkBName = "brittSpokeB-vNET"

$subskB = @{
    Name = $subskBName
    AddressPrefix = $subskBAddressPrefix
    VirtualNetwork = $spokeBvirtualNetwork
}
$skBsubnetConfig = Add-AzVirtualNetworkSubnetConfig @subskB

# Assign Front end subnet to Virtual Network
$spokeBvirtualNetwork | Set-AzVirtualNetwork