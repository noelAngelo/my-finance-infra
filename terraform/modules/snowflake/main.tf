resource "snowflake_warehouse" "this" {
  name              = "${var.project}-${var.warehouse_name}-${var.environment}"
  warehouse_size    = upper(var.warehouse_size)
  auto_suspend      = var.auto_suspend
  auto_resume       = var.auto_resume
  min_cluster_count = var.min_cluster_count
  max_cluster_count = var.max_cluster_count
  scaling_policy    = upper(var.scaling_policy)
}