module "azure_aviatrix_staging_can_cent_transit" {
  source = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version                  = "v2.6.0"
  cloud                       = "Azure"
  account                     = "Azure"
  region                      = "South Central US"
  name                        = "vnet-transit"
  gw_name                     = "Transit-Gateway1"
  cidr                        = "10.200.0.0/20"
  ha_gw                       = false
  instance_size               = "Standard_B4ms"
  learned_cidrs_approval_mode = "connection"
  enable_segmentation         = true
  enable_transit_firenet      = true
  enable_bgp_over_lan         = true
  bgp_lan_interfaces_count    = 1
  bgp_ecmp                    = true
  local_as_number             = 65000
  single_az_ha = true
}
