resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.dynamodbname
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key

  attribute {
    name = var.attribute-name
    type = var.attribute-type
  }
}

