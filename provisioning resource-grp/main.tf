terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.59.0"
    }
  }
}


provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "test" {
  name     = "terraf"
  location = "North Europe"
}

resource "azurerm_storage_account" "acc" {
  name                     = "terraform"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    envoirnment = "development"
  }
}

