# #Create an Aviatrix Spoke Transit Attachment
resource "aviatrix_spoke_transit_attachment" "attachment1" {
  spoke_gw_name   = var.spoke_gateway1_name
  transit_gw_name = var.transit_gateway1_name
#   #route_tables    = [
#     #"rtb-737d540c",
#     #"rtb-626d045c"
#   #]
}

# #   #depends_on = [ aviatrix_spoke_gateway.spoke_gateway1_azure, aviatrix_transit_gateway.transit_gateway1_azure ]
# }