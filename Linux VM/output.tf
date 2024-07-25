output "admin_ssh_key" {
 value = azurerm_linux_virtual_machine.main.admin_ssh_key
  
}

output "azurerm_public_ip" {
    value = azurerm_public_ip.main.ip_address
  
}