#For deployment after accepting azure marketplace agreement, comment the main.tf in the azure market place module. modules > control plane > modules > azure_marketplace_agreement

module "control_plane" {
  source  = "terraform-aviatrix-modules/azure-controlplane/aviatrix"
  version = "1.1.3"

  controller_name           = "azure-controller"
  incoming_ssl_cidrs        = ["47.186.0.0/16"]
  controller_admin_email    = "mtedeschi@aviatrix.com"
  controller_admin_password = var.aviatrix_controller_password
  account_email             = "mtedeschi@aviatrix.com"
  access_account_name       = "Azure"
  customer_id               = var.aviatrix_customer_id
  location                  = "East US"
  controller_version        = "8.0.30"
}

output "controlplane_data" {
  value = module.control_plane
  sensitive = true
}
