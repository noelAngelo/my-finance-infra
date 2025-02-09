#------------------------------------------------------------------------------
# Create Snowflake Warehouse
#------------------------------------------------------------------------------

module "snowflake_warehouse" {
  source             = "../../modules/snowflake"
  project            = var.project
  environment        = var.environment
  warehouse_name     = var.snowflake_warehouse_name
  snowflake_username = var.snowflake_username
  snowflake_password = var.snowflake_password
  snowflake_region   = var.snowflake_region
  snowflake_account  = var.snowflake_account

}