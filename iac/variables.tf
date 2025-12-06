variable "linode_token" {
  description = "Linode API token"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Name of the Object Storage bucket"
  type        = string
  default     = "camdenwander-com"
}

variable "object_storage_region" {
  description = "Object Storage region"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Domain name for the site"
  type        = string
  default     = "camdenwander.com"
}
