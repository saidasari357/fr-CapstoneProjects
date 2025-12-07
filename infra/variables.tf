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

  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}


variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "client_id" {
  type        = string
  description = "Service principal appId"
}

variable "client_secret" {
  type        = string
  description = "Service principal password"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}

variable "resource_group_name" {
  type        = string
  description = "Existing or new resource group name"
  default     = "rg-expense-recorder"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "centralindia"
}

variable "app_service_name" {
  type        = string
  description = "Name of the App Service"
  default     = "expense-recorder-webapp"
}
