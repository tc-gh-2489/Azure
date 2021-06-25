#Create-Random-WindowsVM.ps1

# Variables for common values
$random = Get-Random -Minimum 10000 -Maximum 99999
$resourceGroup = "test-$random-rg"
$vmName = "vm-$random"
$location = "uksouth"
$size = "Standard_B2s"
$image = "Win2019DataCenter"
$openports = 3389

# Create user object
$cred = Get-Credential azureuser$random -Message "Enter password for the virtual machine."

# Create a resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create a virtual machine
New-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Location $location -Size $size -Image $image -OpenPorts $openports -Credential $cred 
