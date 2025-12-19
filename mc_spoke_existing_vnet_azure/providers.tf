terraform {
  required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "~>8.0.30"
    }
  }
}

provider "aviatrix" {
  # Configuration options
  controller_ip = var.avx_controller_ip
  username = var.avx_controller_username
  password = var.aviatrix_controller_password
  skip_version_validation = false
  verify_ssl_certificate = false
}

provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}
