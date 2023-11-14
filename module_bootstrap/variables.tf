variable "dynamodb_table" {
  description = "Name of the DynamoDB Table for locking Terraform state."
  default     = "terraform-state-lock"
  type        = string
}

variable "dynamodb_table_tags" {
  description = "Tags of the DynamoDB Table for locking Terraform state."
  default     = {}
  type        = map(string)
}

variable "region" {
  description = "AWS region."
  type        = string
}

variable "log_retention" {
  description = "Log retention of access logs of state bucket."
  default     = 90
  type        = number
}

variable "bucket" {
  description = "Name of bucket"
  default     = "tf-state"
  type        = string
}

variable "log_name" {
  description = "Log name (for backwards compatibility this can be modified to logs)"
  default     = "log"
  type        = string
}

variable "log_bucket_versioning" {
  description = "A string that indicates the versioning status for the log bucket."
  default     = "Disabled"
  type        = string
  validation {
    condition     = contains(["Enabled", "Disabled", "Suspended"], var.log_bucket_versioning)
    error_message = "Valid values for versioning_status are Enabled, Disabled, or Suspended."
  }
}

variable "state_bucket_tags" {
  type        = map(string)
  default     = {}
  description = "Tags to associate with the bucket storing the Terraform state files"
}

variable "log_bucket_tags" {
  type        = map(string)
  default     = {}
  description = "Tags to associate with the bucket storing the Terraform state bucket logs"
}

variable "enable_s3_public_access_block" {
  description = "Bool for toggling whether the s3 public access block resource should be enabled."
  type        = bool
  default     = true
}

variable "dynamodb_point_in_time_recovery" {
  type        = bool
  default     = false
  description = "Point-in-time recovery options"
}

variable "manage_account_alias" {
  type        = bool
  default     = true
  description = "Manage the account alias as a resource. Set to 'false' if this behavior is not desired."
}

variable "kms_master_key_id" {
  type        = string
  default     = ""
  description = "The AWS KMS master key ID used for the SSE-KMS encryption of the state bucket."
}

variable "encrypt" {
  type        = bool
  default     = false
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
}