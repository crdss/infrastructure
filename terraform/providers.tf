terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.5.0"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = "$(var.LINODE_ACCESS_TOKEN)"
}
