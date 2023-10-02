terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
       prevent_deletion_if_contains_resources = false
     }
  }
}

resource "azurerm_resource_group" "linux-function-rg" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_storage_account" "linux-storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.linux-function-rg.name
  location                 = azurerm_resource_group.linux-function-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "linux-service-plan" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.linux-function-rg.name
  location            = azurerm_resource_group.linux-function-rg.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_application_insights" "linux-application-insights" {
  name                = "application-insights-${var.azurerm_linux_function_app}"
  location            = "${azurerm_resource_group.linux-function-rg.location}"
  resource_group_name = "${azurerm_resource_group.linux-function-rg.name}"
  application_type    = "other"
}

resource "azurerm_linux_function_app" "linux-python-linux-function-app" {
  name                = var.azurerm_linux_function_app
  resource_group_name = azurerm_resource_group.linux-function-rg.name
  location            = azurerm_resource_group.linux-function-rg.location
  
  service_plan_id            = azurerm_service_plan.linux-service-plan.id
  storage_account_name       = azurerm_storage_account.linux-storage-account.name
  storage_account_access_key = azurerm_storage_account.linux-storage-account.primary_access_key
  https_only                 = true
  site_config {
    application_insights_key = azurerm_application_insights.linux-application-insights.instrumentation_key
    application_insights_connection_string = azurerm_application_insights.linux-application-insights.connection_string
    application_stack {
        python_version = 3.11 #FUNCTIONS_WORKER_RUNTIME        
  }
  }
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.linux-application-insights.instrumentation_key}"
  }
}


output "resource_group_id" {
  value = azurerm_resource_group.linux-function-rg.id
}

output "storage_account_id" {
  value = azurerm_storage_account.linux-storage-account.id
}

output "service_plan_id" {
  value = azurerm_service_plan.linux-service-plan.id
}

output "linux_function_app_id" {
  value = azurerm_linux_function_app.linux-python-linux-function-app.id
}