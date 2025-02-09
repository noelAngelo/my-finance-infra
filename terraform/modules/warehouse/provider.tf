terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 1.0.2"
    }
  }

  required_version = ">= 1.5.7"

}

provider "snowflake" {
  account_name = var.snowflake_account
  organization_name = var.snowflake_organization_name
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = var.snowflake_role
}