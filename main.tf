terraform {
  required_version = "~>1.5.0"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.10.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"
    #assume_role {
        #role_arn = "arn:aws:iam::${var.account_id}:role/${var.role}"
    #}
}
terraform {
  backend "s3" {

  }
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
