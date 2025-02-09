variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "snowflake_warehouse_name" {
  description = "The name of the Snowflake warehouse"
  type        = string
}

variable "snowflake_account" {
  description = "The Snowflake account identifier"
  type        = string
}

variable "snowflake_region" {
  description = "Snowflake region where the account is located"
  type        = string
}

variable "default_warehouse_size" {
  description = "Default size for warehouses (X-SMALL, SMALL, MEDIUM, LARGE, X-LARGE, ...)"
  type        = string
  default     = "X-SMALL"

  validation {
    condition     = contains(["X-SMALL", "SMALL", "MEDIUM", "LARGE", "X-LARGE", "2X-LARGE", "3X-LARGE", "4X-LARGE"], upper(var.default_warehouse_size))
    error_message = "The warehouse size must be one of: X-SMALL, SMALL, MEDIUM, LARGE, X-LARGE, 2X-LARGE, 3X-LARGE, 4X-LARGE"
  }
}

variable "default_warehouse_auto_suspend" {
  description = "Number of seconds of inactivity after which warehouse will be automatically suspended (0 means never)"
  type        = number
  default     = 300
}

variable "default_warehouse_auto_resume" {
  description = "Whether the warehouse should automatically resume when accessed"
  type        = bool
  default     = true
}

variable "snowflake_username" {
  description = "Snowflake username for authentication"
  type        = string
  sensitive   = true
}

variable "snowflake_password" {
  description = "Snowflake password for authentication"
  type        = string
  sensitive   = true
}