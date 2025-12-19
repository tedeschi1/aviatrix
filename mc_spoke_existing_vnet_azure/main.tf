data "azurerm_virtual_network" "vnet1" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "vnet1_gw_subnet" {
  name                 = "aviatrix-gateways"
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

module "spoke_aws_1" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "8.0.0"

  cloud            = "Azure"
  name             = "avx-central-us-spoke1"
  region           = "Central US"
  account          = "Azure"
  transit_gw       = "avx-central-us-transit"
  #network_domain  = "green"
  use_existing_vpc = true
  vpc_id           = format("%s:%s:%s", data.azurerm_virtual_network.vnet1.name, data.azurerm_virtual_network.vnet1.resource_group_name, data.azurerm_virtual_network.vnet1.guid)
  gw_subnet        = data.azurerm_subnet.vnet1_gw_subnet.address_prefixes[0]
  hagw_subnet      = data.azurerm_subnet.vnet1_gw_subnet.address_prefixes[0] #Can be the same subnet, as in Azure subnets stretch AZ's.
}
