module "redirector" {
  source = "../modules/redirector"

  linode_access_token = var.linode_access_token
  linode_ssh_key      = var.linode_ssh_key

  primary_domain = "centreregiondownsyndrome.org"
  alias_domains = [
    "centrecountydownsyndrome.org",
    "crdss.org"
  ]

  instance = local.redirector_instance
}

module "primary_domain" {
  source = "../modules/domain"

  linode_access_token = var.linode_access_token

  soa = {
    type   = local.soa_type
    domain = local.primary_domain.domain_name
    email  = local.soa_email
    tags   = local.tags
  }

  web_server               = local.primary_domain.cms_server_ip
  mail_servers             = local.mail_servers
  google_site_verification = local.primary_domain.google_site_verification
}

module "alias_domains" {
  source   = "../modules/domain"
  for_each = tomap(local.alias_domains)

  linode_access_token = var.linode_access_token

  soa = {
    type   = local.soa_type
    domain = each.key
    email  = local.soa_email
    tags   = local.tags
  }

  web_server               = module.redirector.ip
  mail_servers             = local.mail_servers
  google_site_verification = each.value.google_site_verification
}
