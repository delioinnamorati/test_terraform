#
# Terraform state bucket
#


locals {
  # state_bucket   = "${var.account_alias}-${var.bucket_purpose}-${var.region}"
  logging_bucket = "${var.bucket}-logging"
} 


module "terraform_state_bucket" {
  source  = "trussworks/s3-private-bucket/aws"
  version = "~> 7.1.0"

  bucket         = var.bucket
  logging_bucket = local.logging_bucket

  use_account_alias_prefix = false
  bucket_key_enabled       = var.encrypt
  kms_master_key_id        = var.kms_master_key_id

  enable_s3_public_access_block = var.enable_s3_public_access_block
  tags                          = var.state_bucket_tags


  depends_on = [
    module.terraform_state_bucket_logs
  ]
}

#
# Terraform state bucket logging
#

module "terraform_state_bucket_logs" {
  source  = "trussworks/logs/aws"
  version = "~> 16.1.0"

  s3_bucket_name          = local.logging_bucket
  default_allow           = false
  s3_log_bucket_retention = var.log_retention
  versioning_status       = var.log_bucket_versioning

  tags = var.log_bucket_tags
}

#
# Terraform state locking
#

# Ignore warnings about point-in-time recovery since this table holds no data
# The terraform state lock is meant to be ephemeral and does not need recovery
#tfsec:ignore:AWS086
resource "aws_dynamodb_table" "terraform_state_lock" {
  name     = var.dynamodb_table
  hash_key = "LockID"

  billing_mode = "PAY_PER_REQUEST"

  server_side_encryption {
    enabled = true
  }

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = var.dynamodb_point_in_time_recovery
  }

  tags = var.dynamodb_table_tags
}