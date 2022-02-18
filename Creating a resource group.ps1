$rgName ="BrittanyTestRG"
$rgLocation = "East US"

$rg = @{
    Name = $rgName
    Location = $rgLocation
}
New-AzResourceGroup @rg 