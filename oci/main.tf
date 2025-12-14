 resource "aviatrix_transit_gateway" "transit_gateway1_ashburn" {
  cloud_type          = 16
  account_name        = "OCI"
  gw_name             = "avtxgw-oci-tranist"
  vpc_id              = "ocid1.vcn.oc1.iad.xxxxxxxxx"
  vpc_reg             = "us-ashburn-1"
  gw_size             = "VM.Standard2.2"
  subnet              = "10.10.0.0/28"
  availability_domain = data.aviatrix_vpc.mgmt.availability_domains[0]
  fault_domain        = data.aviatrix_vpc.mgmt.fault_domains[0]
}

data "aviatrix_vpc" "mgmt" {
  name = "vcn-avx-mgmt"
}

# # Create an Aviatrix OCI Spoke Gateway
resource "aviatrix_spoke_gateway" "spoke_gateway1_ashburn" {
  cloud_type          = 16
  account_name        = "OCI"
  gw_name             = "avtxgw-oci-spoke"
  vpc_id              = "ocid1.vcn.oc1.iad.xxxxxxx"
  vpc_reg             = "us-ashburn-1"
  gw_size             = "VM.Standard2.2"
  subnet              = "10.11.2.0/24"
  availability_domain = data.aviatrix_vpc.vcn-spoke.availability_domains[0]
  fault_domain        = data.aviatrix_vpc.vcn-spoke.fault_domains[0]
  manage_ha_gateway   = false
}

data "aviatrix_vpc" "vcn-spoke" {
  name = "vcn-spoke"
} 

# Create an Aviatrix Spoke Transit Attachment
resource "aviatrix_spoke_transit_attachment" "test_attachment" {
  spoke_gw_name   = "avtxgw-oci-spoke"
  transit_gw_name = "avtxgw-oci-tranist"
  depends_on = [ aviatrix_spoke_gateway.spoke_gateway1_ashburn, aviatrix_transit_gateway.transit_gateway1_ashburn ]
}

# Create an OCI VPC
resource "aviatrix_vpc" "oci_vpc" {
  cloud_type   = 16
  account_name = "OCI"
  region       = "us-ashburn-1"
  name         = "oci-vpc"
  cidr         = "10.200.0.0/20"
}

resource "oci_core_subnet" "test_subnet" {
    #Required
    cidr_block = "10.200.5.0/24"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaay2awolfei5xwwnzdaep4ozvau3x7c6t7jzcwdecjyvjfzplnb4ha"
    vcn_id = aviatrix_vpc.oci_vpc.id
}
