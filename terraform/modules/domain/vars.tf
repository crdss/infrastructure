variable "linode_access_token" {
  type        = string
  description = "Token that provides remote access to Linode"
  sensitive   = true
  nullable    = false
}

variable "soa" {
  type = object({
    type   = string
    domain = string
    email  = string
    tags   = list(string)
  })
}

variable "web_server" {
  type        = string
  description = "IP address assigned to the A records for this domain"
  nullable    = false
}

variable "mail_servers" {
  type = map(object({
    priority = number
  }))
}

variable "google_site_verification" {
  type        = string
  description = ""
  sensitive   = true
  nullable    = false
}
