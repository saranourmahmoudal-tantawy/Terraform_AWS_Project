module "network" {
  source         = "../modules/network"
  cidr           = var.cidr
  private_subnet = var.private_subnet
  public_subnet  = var.public_subnet

  eg_protocol   = var.eg_protocol
  eg_rule_no    = var.eg_rule_no
  eg_action     = var.eg_action
  eg_cidr_block = var.eg_cidr_block
  eg_from_port  = var.eg_from_port
  eg_to_port    = var.eg_to_port

  in_protocol   = var.in_protocol
  in_action     = var.in_action
  in_rule_no    = var.in_rule_no
  in_cidr_block = var.in_cidr_block
  in_from_port  = var.in_from_port
  in_to_port    = var.in_to_port

}

module "EC2_instance" {
  source        = "../modules/EC2_instance"
  ami           = var.ami
  instance_type = var.instance_type
  EC2_sg        = var.EC2_sg
  publicsubnet  = module.network.public_subnet
}

module "DynamoDB_table" {
  source         = "../modules/DynamoDB_table"
  dynamodbname   = var.dynamodbname
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  attribute-name = var.attribute-name
  attribute-type = var.attribute-type
}

module "S3_bucket" {
  source = "../modules/S3_bucket"
  bucket = var.bucket
}

module "SecurityGroup" {
  source              = "../modules/SecurityGroup"
  vpc_id              = module.network.vpc_id
  ingress_from_port   = var.ingress_from_port
  ingress_to_port     = var.ingress_to_port
  ingress_protocol    = var.ingress_protocol
  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_from_port    = var.egress_from_port
  egress_to_port      = var.egress_to_port
  egress_protocol     = var.egress_protocol
  egress_cidr-blocks  = var.egress_cidr-blocks
}

module "vpc_endpoint" {
  source         = "../modules/vpc_endpoint"
  vpc_id         = module.network.vpc_id
  region         = var.region
  route_table_id = module.network.private_route_table_id
}