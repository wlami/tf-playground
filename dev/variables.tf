# INWX
variable "inwx_username" {}
variable "inwx_password" {}
#variable "inwx_tan" currently TAN doesn't work - contact support and get an API account with limited scope
variable "inwx_sandbox" {
  default = false
}

# HETZNER
variable "hcloud_token" {}

variable "domain" {}
variable "subdomain" {}