locals {
  tags = [
    "env:prd",
    "creator:terraform",
    "repo:github.com/crdss/infrastructure",
    "ci_cd: env0"
  ]

  redirector_instance = {
    label  = "redirector"
    image  = "linode/alpine3.18"
    region = "us-east"
    type   = "g6-nanode-1"

    tags = local.tags
  }

  primary_domain = {
    domain_name              = "centreregiondownsyndrome.org"
    google_site_verification = "gMnnceZYhC6SnRpPtlPLsmYfYqj2M7fVYnpwAZQF0p4"
    cms_server_ip            = "199.34.228.77"
  }

  alias_domains = {
    "centrecountydownsyndrome.org" = {
      google_site_verification = ""
    },
    "crdss.org" = {
      google_site_verification = "U1bNluZCzJBAAqGy8SyOMLiLJR8jFx3_wIJevhLgPU0"
    }
  }

  soa_email = "smoyer64@gmail.com"
  soa_type  = "master"

  mail_servers = {
    "ASPMX.L.GOOGLE.COM" = {
      priority = "1"
    },
    "ALT1.ASPMX.L.GOOGLE.COM" = {
      priority = "5"
    },
    "ALT2.ASPMX.L.GOOGLE.COM" = {
      priority = "5"
    },
    "ASPMX2.GOOGLEMAIL.COM" = {
      priority = "10"
    },
    "ASPMX3.GOOGLEMAIL.COM" = {
      priority = "10"
    }
  }
}
