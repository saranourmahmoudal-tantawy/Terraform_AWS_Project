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