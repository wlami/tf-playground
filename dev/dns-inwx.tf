provider "inwx" {
  username = "${var.inwx_username}"
  password = "${var.inwx_password}"
  sandbox  = "${var.inwx_sandbox}" // default is false
}

// Example record
resource "inwx_record" "ns-azure-redirect" {
  #iterate over all name servers azure provides
  count = "${length(azurerm_dns_zone.zone_azure.name_servers)}"

  domain   = "${var.domain}"
  name     = "${var.subdomain}"
  type     = "NS"
  #iterate over all name servers and remove the last "." dot character as INWX does not support it
  value    = "${replace(azurerm_dns_zone.zone_azure.name_servers[count.index],"/[.]$/","")}"
  ttl      = 3600
  priority = 10
}

