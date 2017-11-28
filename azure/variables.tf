variable "resource_group" {
  description = "The name of the resource group in which to create the virtual network."
  default = "rg-1"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "australiasoutheast"
}

variable "sql_admin" {
  description = "The administrator username of the SQL Server."
  default = "ned"
}

variable "sql_password" {
  description = "The administrator password of the SQL Server."
  default = "admin123acc123"
}
