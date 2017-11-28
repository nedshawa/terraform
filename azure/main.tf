provider "azurerm" {
  subscription_id = "2ea2733f-a18f-4b5d-a61c-2652b7da9f79"
  tenant_id       = "815a016b-cc6e-434e-8eff-284050d87984"
  client_id = "41ca1915-199a-4844-ac4e-257a20282908"
  client_secret = "terraform123"
}
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

resource "azurerm_sql_database" "db" {
  name                             = "mysqldatabase"
  resource_group_name              = "${azurerm_resource_group.rg.name}"
  location                         = "${var.location}"
  edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
  server_name                      = "${azurerm_sql_server.server.name}"
}

resource "azurerm_sql_server" "server" {
  name                         = "${var.resource_group}-sqlsvr"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "${var.sql_admin}"
  administrator_login_password = "${var.sql_password}"
}

resource "azurerm_sql_firewall_rule" "fw" {
  name                = "firewallrules"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = "${azurerm_sql_server.server.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
