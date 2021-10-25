provider "azurerm" {
    features {}
}

# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "BOSS" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = "demo"
  }
}

resource "azurerm_virtual_network" "AVP" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.BOSS.location
  resource_group_name = azurerm_resource_group.BOSS.name
}

resource "azurerm_subnet" "internal" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.BOSS.name
  virtual_network_name = azurerm_virtual_network.AVP.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "VPP" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.BOSS.location
  resource_group_name = azurerm_resource_group.BOSS.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "MUMBAI" {
  name                  = var.virtual_machine_name
  location              = azurerm_resource_group.BOSS.location
  resource_group_name   = azurerm_resource_group.BOSS.name
  network_interface_ids = [azurerm_network_interface.VPP.id]
  vm_size               = "Standard_D2s_v3"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "Patil123"
    admin_password = "Patil@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "demo"
  }
}
resource "azurerm_managed_disk" "MEGA" {
  name                 = var.managed_disk_name
  location             = azurerm_resource_group.BOSS.location
  resource_group_name  = azurerm_resource_group.BOSS.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.MEGA.id
  virtual_machine_id = azurerm_virtual_machine.MUMBAI.id
  lun                = "10"
  caching            = "ReadWrite"
}
