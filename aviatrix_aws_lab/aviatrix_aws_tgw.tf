# Create an Aviatrix AWS TGW
resource "aviatrix_aws_tgw" "test_aws_tgw" {
  account_name                      = "AWS_Corp"
  aws_side_as_number                = "64512"
  region                            = "us-east-1"
  tgw_name                          = "test-tgw"
}

# Create an Aviatrix AWS TGW VPC Attachment
resource "aviatrix_aws_tgw_vpc_attachment" "test_aws_tgw_vpc_attachment" {
  tgw_name            = "test-tgw"
  region              = "us-east-1"
  network_domain_name = "Default_Domain"
  vpc_account_name    = "AWS_Corp"
  vpc_id              = aws_vpc.nva_vpc1.id
}
