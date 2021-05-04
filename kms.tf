locals {
  common_name               = lower("${var.mongodb_project_name}-mongodbatlas-encrypt")
  encrypt_at_rest_key_alias = "alias/${local.common_name}"
}

resource "aws_kms_key" "encrypt" {
  description         = "Key used to encrypt data in clusters created on ${var.mongodb_project_name} project"
  enable_key_rotation = var.enable_kms_key_rotation

  /*lifecycle {
    prevent_destroy = true
  }*/
}

resource "aws_kms_alias" "encrypt" {
  name          = local.encrypt_at_rest_key_alias
  target_key_id = aws_kms_key.encrypt.id
}
