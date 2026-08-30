terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ashishstorage12"
    storage_account_name = "ashishstorage1234"
    container_name       = "statefile"
    key                  = "preprod.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "6384f8c0-3c9e-42a5-8f14-d8898aa55335"
}