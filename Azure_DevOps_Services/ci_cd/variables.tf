variable "client_id" {
  description = "The Client ID for authentication"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for authentication"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "The Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID"
  type        = string
}

variable "rg" {
  type    = string
  default = "YuliiaHrabovenko"
}

variable "location" {
  type    = string
  default = "Central US"
}

variable "back_asp_name" {
  type    = string
  default = "backend-asp-1372"
}

variable "back_app_name" {
  type    = string
  default = "backend-app-1372"
}

variable "front_asp_name" {
  type    = string
  default = "frontend-asp-1372"
}

variable "front_app_name" {
  type    = string
  default = "frontend-app-1372"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "sql_db_name" {
  type        = string
  description = "The name of the SQL Database."
  default     = "Node_App_DB359"
}

variable "admin_username" {
  type        = string
  description = "The administrator username of the SQL logical server."
  default     = "azureadmin"
}

variable "sql_admin_password" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = true
  default     = null
}