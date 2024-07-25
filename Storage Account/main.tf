provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.prefix}storageacct"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "Storage"
  cross_tenant_replication_enabled = "true"
  enable_https_traffic_only = "true"
  min_tls_version = "TLS1_2"
  shared_access_key_enabled = "true"
 

  network_rules {
    default_action = "Deny"
    ip_rules       = ["0.0.0.0/0"]
  }
}