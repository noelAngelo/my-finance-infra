resource "snowflake_warehouse" "this" {
  name              = replace(upper("${var.project}-${var.environment}-WH"), "-", "_")
  warehouse_size    = upper(var.warehouse_size)
  auto_suspend      = var.auto_suspend
  auto_resume       = var.auto_resume
}

# Create finance analytics database
resource "snowflake_database" "analytics" {
  name                        = replace(upper("${var.project}-${var.environment}-ANALYTICS"), "-", "_")
  comment                     = "Personal finance analytics database"
  data_retention_time_in_days = 1
}

# Create RAW schema for DLT loading
resource "snowflake_schema" "raw" {
  database   = snowflake_database.analytics.name
  name       = "RAW"
  comment    = "Raw data files loaded via DLT"
}