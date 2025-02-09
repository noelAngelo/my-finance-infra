resource "snowflake_database_role" "dlt_loader_role" {
  database = var.database
  name     = "dlt_loader_role"
  comment  = "Role for DLT loader to access the ${var.database} database"
}

resource "snowflake_database_role" "parent_database_role" {
  database = var.database
  name     = "SYSADMIN"
}

resource "snowflake_grant_database_role" "g" {
  database_role_name        = "\"${var.database}\".\"${snowflake_database_role.dlt_loader_role.name}\""
  parent_database_role_name = "\"${var.database}\".\"${snowflake_database_role.parent_database_role.name}\""
}

resource "snowflake_grant_privileges_to_database_role" "db_role_privileges" {
  database_role_name = snowflake_database_role.dlt_loader_role.fully_qualified_name
  on_database        = snowflake_database_role.dlt_loader_role.database
  all_privileges = true
}

resource "snowflake_user" "dlt_loader_user" {
  name     = "dlt_loader_user"
  password = var.dlt_loader_password
  comment  = "User for DLT loader to access the ${var.database} database"

  login_name = "dlt_loader"
  first_name = "DLT"
  last_name  = "Loader"
  email      = "dlt_loader@example.com"
  display_name = upper("DLT Loader")

  default_secondary_roles_option = "ALL"
  default_role = snowflake_database_role.dlt_loader_role.fully_qualified_name

  must_change_password = false
}
