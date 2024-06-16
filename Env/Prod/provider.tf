terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.107.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "chauhan-rg1"
    storage_account_name = "chauhansa001"
    container_name       = "sscontainer"
    key                  = "prod.terraform.tfstate"

  }
}

provider "azurerm" {
  features {

  }
}