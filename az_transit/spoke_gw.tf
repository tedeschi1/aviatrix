# Create an Azure VNet
resource "aviatrix_vpc" "azure_vnet_spoke1" {
  cloud_type           = 8
  account_name         = "Azure"
  region               = "South Central US"
  name                 = "azure-vnet2"
  cidr                 = "10.251.0.0/20"
  aviatrix_firenet_vpc = false
}

output "spoke1_vnet_id" {
  value = aviatrix_vpc.azure_vnet_spoke1.vpc_id
}

# Create an Aviatrix Azure Spoke Gateway
resource "aviatrix_spoke_gateway" "spoke_gateway1_azure" {
  cloud_type        = 8
  account_name      = "Azure"
  gw_name           = var.spoke_gateway1_name
  vpc_id            = aviatrix_vpc.azure_vnet_spoke1.vpc_id
  vpc_reg           = "South Central US"
  gw_size           = "Standard_B2s"
  subnet            = aviatrix_vpc.azure_vnet_spoke1.subnets[0].cidr
  #zone              = "az-1"
  #single_ip_snat    = false
  #manage_ha_gateway = false
}