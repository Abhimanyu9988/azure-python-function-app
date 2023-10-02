variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "abhi-functions-rg"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "abhifunctionsa"
}

variable "service_plan_name" {
  description = "Name of the Azure Service Plan"
  type        = string
  default     = "abhi-python-service-plan"
}

variable "azurerm_linux_function_app"{
    description = "Name of the Azure Function App"
    type        = string
    default     = "abhi-python-function"
}