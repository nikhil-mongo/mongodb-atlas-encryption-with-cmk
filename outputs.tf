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

/*output "snapshot_backup_policy" {
  description = "Cloud backup policy applied to the cluster"
  value       = mongodbatlas_cluster.cluster.snapshot_backup_policy
}*/
