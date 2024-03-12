output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "public_subnet" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet" {
  value = aws_subnet.private_subnet.id
}

output "public_route_table_id" {
  value = aws_route_table.public_subnet.id
}

output "private_route_table_id" {
  value = aws_route_table.private_subnet.id
}

output "acl_id" {
  value = aws_network_acl.acl.id
}
