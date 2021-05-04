output "kms_key_id" {
  value = aws_kms_key.encrypt.key_id
}

output "kms_key_arn" {
  value = aws_kms_key.encrypt.arn
}

output "kms_key_alias" {
  value = aws_kms_alias.encrypt.name
}

output "aws_iam_role_arn" {
  value = aws_iam_role.test_role.arn
}

output "cloud_provider_access_role_id" {
  value = mongodbatlas_cloud_provider_access_setup.setup_only.role_id
}
output "name" {
  description = "Name of the created mongodb atlas cluster"
  value       = var.mongodb_cluster_name
}

output "cluster_id" {
  description = "Id of the created cluster"
  value       = mongodbatlas_cluster.cluster.id
}

output "project_id" {
  description = "Id of the created project"
  value       = var.project_id
}

output "connection_strings" {
  description = "Database connection string"
  value       = mongodbatlas_cluster.cluster.connection_strings
}

output "snapshot_backup_policy" {
  description = "Cloud backup policy applied to the cluster"
  value       = mongodbatlas_cluster.cluster.snapshot_backup_policy
}
