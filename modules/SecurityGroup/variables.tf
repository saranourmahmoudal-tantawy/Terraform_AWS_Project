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

