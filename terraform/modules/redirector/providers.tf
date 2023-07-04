terraform {
  required_version = ">= 1.5.0"

  required_providers {
    ansible = {
      source = "ansible/ansible"
      version = "1.1.0"
    }
    linode = {
      source  = "linode/linode"
      version = "2.5.0"
    }
  }
}
