terraform {
  required_version = ">= 1.5.0"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.5.0"
    }
  }

  backend "remote" {
    hostname = "backend.api.env0.com"
    organization = "48513a87-375a-4b18-b950-2324c8cc362b"
    
    workspaces {
      name = "infrastructure"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = var.linode_access_token
}
