resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  provider = aws.useast1
  public_key = file("C:/Users/Michael Tedeschi/my-key.pub")
  }


resource "aws_instance" "nva_vpc1_ec2" {
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.nva_vpc2_subnet2.id
  key_name      = "deployer-key" 
//  vpc_security_group_ids = [aws_security_group.nsg-ec2.id]

  provider = aws.useast1
  
  tags = {
    Name = "ec2_nva_vpc1"
  }

  # lifecycle {
  #   create_before_destroy = true
  # }

  //depends_on = [ aws_key_pair.deployer, aviatrix_aws_tgw_vpc_attachment.test_aws_tgw_vpc_attachment  ]
}

# resource "aws_instance" "nva_vpc2_ec2" {
#   ami           = "ami-0182f373e66f89c85"  
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.nva_vpc2_subnet1.id
#   key_name      = "deployer-key" 
# //  vpc_security_group_ids = [aws_security_group.nsg-ec2.id]

#   tags = {
#     Name = "ec2_nva_vpc2"
#   }

#   depends_on = [ aws_key_pair.deployer ]
# }

# resource "aws_instance" "ohio_vpc1_ec2" {
#   ami           = "ami-085f9c64a9b75eed5"  
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.ohio_vpc1_subnet1.id
#   key_name      = "deployer-key" 
# //  vpc_security_group_ids = [aws_security_group.nsg-ec2.id]

#   tags = {
#     Name = "ec2_ohio_vpc1"
#   }

#   depends_on = [ aws_key_pair.deployer ]
# }

# resource "aws_instance" "ohio_vpc2_ec2" {
#   ami           = "ami-085f9c64a9b75eed5"  
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.ohio_vpc2_subnet1.id
#   key_name      = "deployer-key" 
# //  vpc_security_group_ids = [aws_security_group.nsg-ec2.id]

#   tags = {
#     Name = "ec2_ohio_vpc2"
#   }

#   depends_on = [ aws_key_pair.deployer ]
# }

# resource "aws_instance" "ohio_vpc3_ec2" {
#   ami           = "ami-085f9c64a9b75eed5"  
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.ohio_vpc3_subnet1.id
#   key_name      = "deployer-key" 
# //  vpc_security_group_ids = [aws_security_group.nsg-ec2.id]

#   tags = {
#     Name = "ec2_ohio_vpc3"
#   }

#   depends_on = [ aws_key_pair.deployer ]
# }

# //resource "aws_security_group" "nsg-ec2" {
# //    name = "nsg-ec2"
# //    description = "Allow SSH to EC2 instances"
# //    vpc_id = aws_vpc.nva_vpc1.id
# //
# //    tags = {
# //       Name = "nsg-ec2"
# //    }
# //}

# //resource "aws_vpc_security_group_ingress_rule" "nsg-ec2" {
# //  security_group_id = aws_security_group.nsg-ec2.id
# //
# //  cidr_ipv4   = "47.186.0.0/16"
# //  from_port   = "*"
# //  ip_protocol = "tcp"
# //  to_port     = 22
# //}
  
