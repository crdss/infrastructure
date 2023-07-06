resource "linode_domain" "this" {
  type      = var.soa.type
  domain    = var.soa.domain
  soa_email = var.soa.email
  ttl_sec   = 300

  tags = var.soa.tags
}

resource "linode_domain_record" "web_servers" {
  for_each = toset(["", "www"])

  domain_id   = linode_domain.this.id
  name        = each.key
  record_type = "A"
  target      = var.web_server
}

resource "linode_domain_record" "mail_servers" {
  for_each = tomap(var.mail_servers)

  domain_id   = linode_domain.this.id
  priority    = each.value.priority
  record_type = "MX"
  target      = each.key
}

resource "linode_domain_record" "google_site_verification" {
  count = var.google_site_verification != "" ? 1 : 0

  domain_id   = linode_domain.this.id
  name        = "google-site-verification"
  record_type = "TXT"
  target      = var.google_site_verification
}