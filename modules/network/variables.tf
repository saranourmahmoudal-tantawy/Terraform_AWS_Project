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

