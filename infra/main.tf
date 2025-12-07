########################################
# Resource Group
########################################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

########################################
# App Service Plan (Linux)
########################################

resource "azurerm_app_service_plan" "plan" {
  name                = "${var.app_service_name}-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind = "linux"

  sku {
    tier = "Basic"
    size = "S1"
  }

  reserved = true # for Linux
}

########################################
# App Service (production slot)
########################################

resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "NODE|18-lts"
  }

  app_settings = {
    WEBSITES_PORT = "3000" # Node app listens on 3000
  }
}

########################################
# Deployment slot: staging
########################################

resource "azurerm_app_service_slot" "staging" {
  name                = "staging"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id
  app_service_name    = azurerm_app_service.app.name

  site_config {
    linux_fx_version = "NODE|18-lts"
  }

  app_settings = {
    WEBSITES_PORT = "3000"
  }
}

########################################
# Optional: Slot swap via Terraform
########################################

# When you apply this, it will swap active slot to "staging"
# (You can comment this out if you prefer portal/manual swap.)

resource "azurerm_app_service_active_slot" "swap_to_staging" {
  resource_group_name   = azurerm_resource_group.rg.name
  app_service_name      = azurerm_app_service.app.name
  app_service_slot_name = azurerm_app_service_slot.staging.name
}
