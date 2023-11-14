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
block = "10.0.0.0/16"
}
