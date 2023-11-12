provider "aws" {
    region = "us-east-1"
    assume_role {
        role_arn = "arn:aws:iam::${var.account_id}:role/${var.role}"
    }
}

resource "null_resource" "example" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
