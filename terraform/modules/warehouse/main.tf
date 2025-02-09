resource "snowflake_warehouse" "this" {
  name              = replace("${var.project}-${upper(var.environment)}-${var.warehouse_name}", "-", "_")
  warehouse_size    = upper(var.warehouse_size)
  auto_suspend      = var.auto_suspend
  auto_resume       = var.auto_resume
}