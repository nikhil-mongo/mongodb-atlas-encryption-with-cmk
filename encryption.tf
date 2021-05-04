resource "mongodbatlas_encryption_at_rest" "encrypt" {
  project_id = var.project_id

  aws_kms = {
    enabled                = true
    customer_master_key_id = aws_kms_key.encrypt.key_id
    region                 = upper(var.aws_region)
    role_id                = mongodbatlas_cloud_provider_access_setup.setup_only.role_id
  }

  # Unified AWS Access needs to be configured and a IAM role based trust relationship
  # established with MongoDb Atlas AWS account before we can turn on encryption.
  depends_on = [aws_kms_alias.encrypt]
}