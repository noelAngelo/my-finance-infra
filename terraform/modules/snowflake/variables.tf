variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "warehouse_name" {
  description = "Name of the warehouse to create"
  type        = string
}

variable "warehouse_size" {
  description = "Size of the warehouse (X-SMALL, SMALL, MEDIUM, LARGE, X-LARGE, ...)"
  type        = string
  default     = "X-SMALL"

  validation {
    condition     = contains(["X-SMALL", "SMALL", "MEDIUM", "LARGE", "X-LARGE", "2X-LARGE", "3X-LARGE", "4X-LARGE"], upper(var.warehouse_size))
    error_message = "The warehouse size must be one of: X-SMALL, SMALL, MEDIUM, LARGE, X-LARGE, 2X-LARGE, 3X-LARGE, 4X-LARGE"
  }
}

variable "auto_suspend" {
  description = "Number of seconds of inactivity after which warehouse will be suspended (0 means never)"
  type        = number
  default     = 300
}

variable "auto_resume" {
  description = "Specifies whether to automatically resume warehouse when a query is submitted"
  type        = bool
  default     = true
}

variable "min_cluster_count" {
  description = "Minimum number of compute clusters for the warehouse (must be 1 or greater)"
  type        = number
  default     = 1
}

variable "max_cluster_count" {
  description = "Maximum number of compute clusters for the warehouse"
  type        = number
  default     = 1
}

variable "scaling_policy" {
  description = "The policy that determines when additional clusters are started (STANDARD or ECONOMY)"
  type        = string
  default     = "ECONOMY"

  validation {
    condition     = contains(["STANDARD", "ECONOMY"], upper(var.scaling_policy))
    error_message = "Scaling policy must be either STANDARD or ECONOMY"
  }
}

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