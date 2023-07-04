variable "instance" {
  description = "Instance configuration"

  type = object({
    label  = string
    image = string
    tags = list(string)
    region = string
    type   = string
  })

  default = {
    label  = "redirector"
    image = "linode/alpine3.18"
    tags = ["redirector", "prd"]
    region = "us-east"
    type   = "g6-nanode-1"
  }
}

variable "linode_access_token" {
  type        = string
  description = "Token that provides remote access to Linode"
  sensitive = true
  nullable = false
}

variable "linode_ssh_key" {
  type = string
  description = "SSH key used to connect to remote Linode"
  sensitive = true
  nullable = false
}

variable "primary_domain" {
  type = string
  description = "The domain where the CRDSS website is located"
  nullable = false
}

variable "alias_domains" {
  type = list(string)
  description = "Domains that should redirect to the primary domain"
  nullable = false
}
