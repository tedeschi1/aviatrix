module "control_plane" {
  source  = "terraform-aviatrix-modules/aws-controlplane/aviatrix"
  version = "1.0.6"

  controller_name           = "aws-controller"
  incoming_ssl_cidrs        = ["47.186.0.0/16"]
  controller_admin_email    = "jdoe@aviatrix.com"
  controller_admin_password = var.controller_admin_password
  account_email             = "jdoe@aviatrix.com"
  access_account_name       = "AWS"
  customer_id               = var.aviatrix_customer_id
}

output "controlplane_data" {
  value = module.control_plane
}
