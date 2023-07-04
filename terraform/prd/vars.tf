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
