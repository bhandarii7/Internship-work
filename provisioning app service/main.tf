terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}


// resource group

resource "azurerm_resource_group" "rg1" {
  name     = "AppServiceRG"
  location = "eastus"
}


// resource plan

resource "azurerm_service_plan" "sp" {
  name                = "example"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  os_type             = "Windows"
  sku_name            = "F1"
}


// app service

resource "azurerm_windows_web_app" "app" {
  name                = "resTF"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  service_plan_id     = azurerm_service_plan.sp.id
  site_config {
    always_on = false
    # remote_debugging_enabled = true
    # remote_debugging_version = "VS2019"
    application_stack {
      current_stack = "node"
      node_version = "18-LTS"
    }
  }

}

