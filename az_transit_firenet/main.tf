module "mc_transit" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "v8.0.0"

  cloud                  = "Azure"
  cidr                   = "10.1.0.0/23"
  region                 = "Central US"
  account                = "Azure"
  enable_transit_firenet = true
}

module "firenet_1" {
  source  = "terraform-aviatrix-modules/mc-firenet/aviatrix"
  version = "v8.0.0"

  transit_module = module.mc_transit
  firewall_image = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
}
