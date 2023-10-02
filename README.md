## Azure Python function app

### The repository containes

# Terraform Azure Function App Deployment

This Terraform configuration sets up Azure resources for deploying a Linux-based Function App running Python.

## Resources Created

1. **Resource Group**: Creates a resource group in Azure.
2. **Storage Account**: A storage account for the Function App.
3. **Service Plan**: The service plan for the Function App.
4. **Application Insights**: Integration with Azure Application Insights.
5. **Linux Function App**: The Linux-based Function App running Python.

## Variables

The following variables are defined with default values:

- **resource_group_name**: Name for the Azure Resource Group.
  - Type: `string`
  - Description: Name of the Azure Resource Group.
  - Default: `abhi-functions-rg`

- **storage_account_name**: Name for the Azure Storage Account.
  - Type: `string`
  - Description: Name of the Azure Storage Account.
  - Default: `abhifunctionsa`

- **service_plan_name**: Name for the Azure Service Plan.
  - Type: `string`
  - Description: Name of the Azure Service Plan.
  - Default: `abhi-python-service-plan`

- **azurerm_linux_function_app**: Name for the Azure Linux Function App.
  - Type: `string`
  - Description: Name of the Azure Function App.
  - Default: `abhi-python-function`

## Prerequisites

- Terraform v1.x.x
- Azure CLI or Azure Service Principal for authentication
- The required Terraform provider (`hashicorp/azurerm` version `3.75.0`)

## Variables Required

- `resource_group_name`: Name for the Azure Resource Group.
- `storage_account_name`: Name for the Azure Storage Account.
- `service_plan_name`: Name for the Azure Service Plan.
- `azurerm_linux_function_app`: Name for the Azure Linux Function App.

## Outputs

- `resource_group_id`: ID of the created Azure Resource Group.
- `storage_account_id`: ID of the created Azure Storage Account.
- `service_plan_id`: ID of the created Azure Service Plan.
- `linux_function_app_id`: ID of the created Azure Linux Function App.

## Usage

1. Ensure you have the prerequisites installed and set up.
2. Clone this repository.
3. Update the variable values in the Terraform script or provide them through a `terraform.tfvars` file.
4. Initialize Terraform:
   ```bash
   terraform init
