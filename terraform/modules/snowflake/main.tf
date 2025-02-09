resource "snowflake_warehouse" "this" {
  name              = "${var.project}-${upper(var.environment)}-${var.warehouse_name}"
  warehouse_size    = upper(var.warehouse_size)
  auto_suspend      = var.auto_suspend
  auto_resume       = var.auto_resume
}