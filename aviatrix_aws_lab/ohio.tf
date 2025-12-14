resource "aws_vpc" "ohio_transit_vpc" {
  cidr_block       = "10.8.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast2

  tags = {
    Name = "vpc-oh-transit"
  }
}

resource "aws_subnet" "ohio_transit_subnet1" {
  vpc_id     = aws_vpc.ohio_transit_vpc.id
  cidr_block = "10.8.0.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "ohio_transit_subnet2" {
  vpc_id     = aws_vpc.ohio_transit_vpc.id
  cidr_block = "10.8.1.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet2"
  }
}

resource "aws_vpc" "ohio_vpc1" {
  cidr_block       = "10.9.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast2

  tags = {
    Name = "vpc-oh-prod"
  }
}

resource "aws_subnet" "ohio_vpc1_subnet1" {
  vpc_id     = aws_vpc.ohio_vpc1.id
  cidr_block = "10.9.0.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "ohio_vpc1_subnet2" {
  vpc_id     = aws_vpc.ohio_vpc1.id
  cidr_block = "10.9.1.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet2"
  }
}

resource "aws_vpc" "ohio_vpc2" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast2

  tags = {
    Name = "vpc-oh-dev"
  }
}

resource "aws_subnet" "ohio_vpc2_subnet1" {
  vpc_id     = aws_vpc.ohio_vpc2.id
  cidr_block = "10.10.0.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "ohio_vpc2_subnet2" {
  vpc_id     = aws_vpc.ohio_vpc2.id
  cidr_block = "10.10.1.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet2"
  }
}

resource "aws_vpc" "ohio_vpc3" {
  cidr_block       = "10.11.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast2

  tags = {
    Name = "vpc-oh-sandbox"
  }
}

resource "aws_subnet" "ohio_vpc3_subnet1" {
  vpc_id     = aws_vpc.ohio_vpc3.id
  cidr_block = "10.11.0.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "ohio_vpc3_subnet2" {
  vpc_id     = aws_vpc.ohio_vpc3.id
  cidr_block = "10.11.1.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet2"
  }
}

resource "aws_vpc" "ohio_vpc4" {
  cidr_block       = "10.12.0.0/16"
  instance_tenancy = "default"

  provider = aws.useast2

  tags = {
    Name = "vpc-oh-egress"
  }
}

resource "aws_subnet" "ohio_vpc4_subnet1" {
  vpc_id     = aws_vpc.ohio_vpc4.id
  cidr_block = "10.12.0.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "ohio_vpc4_subnet2" {
  vpc_id     = aws_vpc.ohio_vpc4.id
  cidr_block = "10.12.1.0/24"

  provider = aws.useast2

  tags = {
    Name = "subnet2"
  }
}