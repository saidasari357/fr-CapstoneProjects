terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"   # Stays on 3.x (4.x removes some slot resources)
    }
  }
}

provider "azurerm" {
  features {}
  
}
