# Create an Aviatrix AzureGov Transit Network Gateway
resource "aviatrix_transit_gateway" "az_transit_gateway_azuregov" {
  cloud_type        = 32
  account_name      = "Azure_Gov"
  gw_name           = "avx-az-transit"
  vpc_id            = aviatrix_vpc.azure_vnet.vpc_id
  vpc_reg           = "USGov Arizona"
  gw_size           = "Standard_B2s"
  subnet            = aviatrix_vpc.azure_vnet.subnets[0].cidr
  # ha_subnet         = aviatrix_vpc.azure_vnet.subnets[1].cidr
  # ha_gw_size        = "Standard_B2s"
  #ha_zone = "az1"
  connected_transit = true
}

# Create an Aviatrix AzureGov Spoke Gateway
resource "aviatrix_spoke_gateway" "test_spoke_gateway_azuregov" {
  cloud_type        = 32
  account_name      = "Azure_Gov"
  gw_name           = "avx-az-spokegw"
  vpc_id            = aviatrix_vpc.azure_spoke_vnet.vpc_id
  vpc_reg           = "USGov Arizona"
  gw_size           = "Standard_B2s"
  subnet            = aviatrix_vpc.azure_spoke_vnet.subnets[0].cidr
  single_ip_snat    = false
  manage_ha_gateway = false
}

# Create an Aviatrix Spoke Transit Attachment
resource "aviatrix_spoke_transit_attachment" "test_attachment" {
  spoke_gw_name   = "avx-az-spokegw"
  transit_gw_name = "avx-az-transit"
  # route_tables    = [
  #   "rtb-737d540c",
  #   "rtb-626d045c"
  # ]
}
