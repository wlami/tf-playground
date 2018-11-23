resource "azurerm_resource_group" "main_rg" {
  name     = "WEDEVRG1-${var.subdomain}.${var.domain}"
  location = "West Europe"
  tags {
    env = "development"
  }
}

resource "azurerm_dns_zone" "zone_azure" {
  name                = "${var.subdomain}.${var.domain}"
  resource_group_name = "${azurerm_resource_group.main_rg.name}"
  zone_type           = "Public"
}

resource "azurerm_dns_a_record" "test" {
  name                = "foo1"
  zone_name           = "${azurerm_dns_zone.zone_azure.name}"
  resource_group_name = "${azurerm_resource_group.main_rg.name}"
  ttl                 = 300
  records             = ["${hcloud_server.foo1.ipv4_address}"]
}