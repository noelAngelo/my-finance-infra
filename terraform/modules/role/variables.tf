

variable "snowflake_account" {
  description = "Snowflake account identifier"
  type        = string
}

variable "snowflake_username" {
  description = "Snowflake username"
  type        = string
}

variable "snowflake_password" {
  description = "Snowflake password"
  type        = string
  sensitive   = true
}

variable "snowflake_region" {
  description = "Snowflake region"
  type        = string
}

variable "snowflake_role" {
  description = "Snowflake role"
  type        = string
}

variable "snowflake_organization_name" {
  description = "Snowflake organization name"
  type        = string
}

variable "database" {
  description = "Database name"
  type        = string
}
