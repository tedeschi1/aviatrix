resource "aws_vpc" "nva_transit_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast1

  tags = {
    Name = "vpc-nv-transit"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.nva_transit_vpc.id
  cidr_block = "10.0.1.0/24"

  provider = aws.useast1

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.nva_transit_vpc.id
  cidr_block = "10.0.2.0/24"

  provider = aws.useast1

  tags = {
    Name = "subnet2"
  }
}

resource "aws_vpc" "nva_vpc1" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast1

  tags = {
    Name = "vpc-nv-qa1"
  }
}

resource "aws_subnet" "nva_vpc1_subnet1" {
  vpc_id     = aws_vpc.nva_vpc1.id
  cidr_block = "10.1.0.0/24"

  provider = aws.useast1

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "nva_vpc1_subnet2" {
  vpc_id     = aws_vpc.nva_vpc1.id
  cidr_block = "10.1.1.0/24"

  provider = aws.useast1

  tags = {
    Name = "subnet2"
  }
}

resource "aws_vpc" "nva_vpc2" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast1

  tags = {
    Name = "vpc-nv-qa2"
  }
}

resource "aws_subnet" "nva_vpc2_subnet1" {
  vpc_id     = aws_vpc.nva_vpc2.id
  cidr_block = "10.2.0.0/24"

  provider = aws.useast1

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "nva_vpc2_subnet2" {
  vpc_id     = aws_vpc.nva_vpc2.id
  cidr_block = "10.2.1.0/24"

  provider = aws.useast1

  tags = {
    Name = "subnet2"
  }
}

resource "aws_internet_gateway" "useast1" {
  vpc_id = aws_vpc.nva_transit_vpc.id

  provider = aws.useast1

  tags = {
    Name = "main"
  }
}

# resource "aws_internet_gateway_attachment" "useast1" {
#   internet_gateway_id = aws_internet_gateway.useast1.id
#   vpc_id              = aws_vpc.nva_transit_vpc.id

#   provider = aws.useast1
# }