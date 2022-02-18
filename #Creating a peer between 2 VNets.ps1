#Set the VNets
$vnet1= Get-AzVirtualNetwork -Name "vnet-DMZ-azureland-dev-eastus-001" -ResourceGroupName "rg-azureland-caelus-dev-eastus-001"
$vnet2= Get-AzVirtualNetwork -Name "vnet-APP-azureland-dev-eastus-001" -ResourceGroupName "rg-azureland-caelus-dev-eastus-001"
#Peer DMZ Vnet to APP Vnet
$pr1Name = "CatDmz-CatApp"
$virtualNetwork = $vnet1
$remote = $vnet2

$pr1 = @{
    Name = $pr1Name
    VirtualNetwork = $virtualNetwork
    RemoteVirtualNetworkId = $remote.Id
}
$peeringNetwork1 = Add-AzVirtualNetworkPeering @pr1


#Peer APP Vnet to DMZ Vnet
$vnet1= Get-AzVirtualNetwork -Name "vnet-DMZ-azureland-dev-eastus-001" -ResourceGroupName "rg-azureland-caelus-dev-eastus-001"
$vnet2= Get-AzVirtualNetwork -Name "vnet-APP-azureland-dev-eastus-001" -ResourceGroupName "rg-azureland-caelus-dev-eastus-001"
$pr2Name = "CatApp-CatDmz"
$virtualNetwork = $vnet2
$remote = $vnet1

$pr2 = @{
    Name = $pr2Name
    VirtualNetwork = $virtualNetwork
    RemoteVirtualNetworkId = $remote.Id
}
$peeringNetwork2 = Add-AzVirtualNetworkPeering @pr2

