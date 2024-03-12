terraform {
  backend "s3" {
    bucket         = "sara-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sara"
  }
}