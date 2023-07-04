terraform {
  required_version = ">= 1.5.0"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.5.0"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = var.linode_access_token
}
