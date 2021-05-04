resource "mongodbatlas_cluster" "cluster" {
  project_id = var.project_id
  name       = var.mongodb_cluster_name

  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "US_EAST_1"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "4.2"

  //Provider Settings "block"
  provider_name               = "AWS"
  disk_size_gb                = 10
  provider_instance_size_name = "M10"

  # Cloud backup
  provider_backup_enabled = true
  pit_enabled             = false

  lifecycle {
    prevent_destroy = true
  }

  # Encryption needs to be turned on for the project before it can be enabled on the cluster
  depends_on = [mongodbatlas_encryption_at_rest.encrypt]
}