
# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = "${var.hcloud_token}"
}

data "hcloud_ssh_key" "ubuntu_dev" {
  fingerprint = "b6:0b:93:41:68:e8:43:b8:e8:47:fd:d2:ae:21:93:f0"
}

resource "hcloud_server" "foo1" {
  image = "ubuntu-16.04"
  name = "foo1"
  server_type = "cx11"
  location = "fsn1"
  ssh_keys = ["${data.hcloud_ssh_key.ubuntu_dev.id}"]
}

# Create a server
#resource "hcloud_server" "web" {
  # ...
#}
