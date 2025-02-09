output "warehouse_name" {
  description = "Name of the created warehouse"
  value       = snowflake_warehouse.this.name
}

# output "dlt_loader_role_name" {
#   description = "Name of the DLT loader role"
#   value       = snowflake_database_role.dlt_loader_role.name
# }

output "finance_database_name" {
  description = "Name of the finance analytics database"
  value       = snowflake_database.analytics.name
}

output "raw_schema_name" {
  description = "Name of the RAW schema"
  value       = snowflake_schema.raw.name
} 