resource "linode_object_storage_bucket" "portfolio_site" {
  cluster = var.object_storage_region
  label   = var.bucket_name
  acl     = "public-read"
  
  cors_enabled = true
}

# Deploy keys for automating object transfers
resource "linode_object_storage_key" "deploy_key" {
  label = "portfolio-deploy-key"
  
  bucket_access {
    bucket_name = linode_object_storage_bucket.portfolio_site.label
    cluster     = linode_object_storage_bucket.portfolio_site.cluster
    permissions = "read_write"
  }
}

# Outputs for GitHub Actions secrets
output "bucket_website_url" {
  value       = "https://${var.bucket_name}.website-${var.object_storage_region}.linodeobjects.com"
  description = "Website URL"
}

output "dns_cname_target" {
  value       = "${var.bucket_name}.website-${var.object_storage_region}.linodeobjects.com"
  description = "Use this value for your CNAME record in Network Solutions"
}

output "access_key" {
  value     = linode_object_storage_key.deploy_key.access_key
  sensitive = true
}

output "secret_key" {
  value     = linode_object_storage_key.deploy_key.secret_key
  sensitive = true
}
