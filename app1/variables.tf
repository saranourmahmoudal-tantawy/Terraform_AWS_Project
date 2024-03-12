#network module
variable "cidr" {
  type = string
}

variable "public_subnet" {
  type = string
}

variable "private_subnet" {
  type = string
}


#variables egress
variable "eg_protocol" {
  type = string
}

variable "eg_rule_no" {
  type = string
}

variable "eg_action" {
  type = string
}

variable "eg_cidr_block" {
  type = string
}

variable "eg_from_port" {
  type = string
}

variable "eg_to_port" {
  type = string
}


#variables ingress
variable "in_protocol" {
  type = string
}

variable "in_rule_no" {
  type = string
}

variable "in_action" {
  type = string
}

variable "in_cidr_block" {
  type = string
}

variable "in_from_port" {
  type = string
}

variable "in_to_port" {
  type = string
}

#EC2 module
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "EC2_sg" {
  type = list(string)
}

variable "publicsubnet" {
  type = string
}

#DynamoDB table
variable "dynamodbname" {
  type = string
}

variable "read_capacity" {
  type = string
}

variable "write_capacity" {
  type = string
}

variable "hash_key" {
  type = string
}

variable "attribute-name" {
  type = string
}

variable "attribute-type" {
  type = string
}

#S3 bucket
variable "bucket" {
  type = string
}

#security group
variable "vpc_id" {
  type = string
}

# ingress
variable "ingress_from_port" {
  type = string
}

variable "ingress_to_port" {
  type = string
}

variable "ingress_protocol" {
  type = string
}

variable "ingress_cidr_blocks" {
  type = list(string)
}

#egress
variable "egress_from_port" {
  type = string
}

variable "egress_to_port" {
  type = string
}

variable "egress_protocol" {
  type = string
}

variable "egress_cidr-blocks" {
  type = list(string)
}

#module vpc_endpoint
variable "region" {
  type = string
}

variable "route_table_id" {
  type = string
}