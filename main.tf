<<<<<<< Updated upstream
=======
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
/*
terraform {
  backend "s3" {
    bucket = "test123-example1-app1"
    key = "terraform.tfstate"
    dynamodb_table = "terraform_state"
    region = "us-east-1"
    encrypt = true
  }
}
*/

>>>>>>> Stashed changes
resource "null_resource" "example" {}
