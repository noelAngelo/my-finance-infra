terraform {
  cloud {

    organization = "noelzy-org"

    workspaces {
      name = "my-finance-infra"
    }
  }
}

#------------------------------------------------------------------------------
# Create Snowflake Warehouse
#------------------------------------------------------------------------------

module "snowflake_warehouse" {
  source      = "../../modules/warehouse"
  project     = var.project
  environment = var.environment

  snowflake_region  = var.snowflake_region
  snowflake_account = var.snowflake_account
  snowflake_role    = var.snowflake_role

  snowflake_username          = var.snowflake_username
  snowflake_password          = var.snowflake_password
  snowflake_organization_name = var.snowflake_organization_name
}

#------------------------------------------------------------------------------
# Create Snowflake Role for DLT Loader
#------------------------------------------------------------------------------

module "snowflake_role" {
  source      = "../../modules/role"

  snowflake_region  = var.snowflake_region
  snowflake_account = var.snowflake_account
  snowflake_role    = var.snowflake_role

  snowflake_username          = var.snowflake_username
  snowflake_password          = var.snowflake_password
  snowflake_organization_name = var.snowflake_organization_name

  database = module.snowflake_warehouse.finance_database_name
  dlt_loader_password = var.dlt_loader_password
}
