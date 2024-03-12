# Choosing randam numbers for naming 
resource "random_id" "id" {
  byte_length = 1
}

# creating VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr

  tags = {
    Name = "VPC-${random_id.id.hex}"
  }
}

# creating a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet-${random_id.id.hex}"
  }
}

# creating a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet

  tags = {
    Name = "private_subnet-${random_id.id.hex}"
  }
}

# creating internet gateway (igw)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "igw-${random_id.id.hex}"
  }
}

# creating nat gateway 
resource "aws_eip" "nat_ip" {

}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "natgw-${random_id.id.hex}"
  }
}

#creating route table
resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block = var.cidr
    gateway_id = "local"
  }

  tags = {
    Name = "route table-${random_id.id.hex}"
  }

}
resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_subnet.id
}

#creating route table
resource "aws_route_table" "private_subnet" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }
  route {
    cidr_block = var.cidr
    gateway_id = "local"
  }

  tags = {
    Name = "route table-${random_id.id.hex}"
  }

}
resource "aws_route_table_association" "private_subnet" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_subnet.id
}
#creating aws network acl
resource "aws_network_acl" "acl" {
  vpc_id = aws_vpc.myvpc.id

  egress {
    protocol   = var.eg_protocol
    rule_no    = var.eg_rule_no
    action     = var.eg_action
    cidr_block = var.eg_cidr_block
    from_port  = var.eg_from_port
    to_port    = var.eg_to_port
  }

  ingress {
    protocol   = var.in_protocol
    rule_no    = var.in_rule_no
    action     = var.in_action
    cidr_block = var.in_cidr_block
    from_port  = var.in_from_port
    to_port    = var.in_to_port
  }

  tags = {
    Name = "acl-${random_id.id.hex}"
  }
}
resource "aws_network_acl_association" "aclpublic" {
  network_acl_id = aws_network_acl.acl.id
  subnet_id      = aws_subnet.public_subnet.id
}
resource "aws_network_acl_association" "aclprivate" {
  network_acl_id = aws_network_acl.acl.id
  subnet_id      = aws_subnet.private_subnet.id
}