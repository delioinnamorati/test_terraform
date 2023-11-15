#  naming convention for bucket name can be changed
# current is {account_id}-{bucket_purpose}-{region}, so path will be 1234-app1-us-east-1/terraform.tfstate
module "bootstrap" {
  source = "../../module_bootstrap"
  region               = var.region
  dynamodb_table = var.dynamodb_table
  bucket       = var.bucket
  encrypt       = var.encrypt
}