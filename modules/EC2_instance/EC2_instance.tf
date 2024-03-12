# Choosing random numbers for naming 
resource "random_id" "id" {
  byte_length = 1
}

# Creating EC2_instance 
resource "aws_instance" "EC2_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "EC2_${random_id.id.hex}"
  }

  subnet_id              = var.publicsubnet
  vpc_security_group_ids = var.EC2_sg

}



