data "linode_profile" "me" {}

resource "linode_instance" "this" {
  label  = var.instance.label
  image  = "linode/alpine3.18"
  region = var.instance.region
  type   = var.instance.type

  authorized_keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClmIepK2ZRo8F31TtnpMkSaqO4OTxYZsSKJGk5ztoL0zJQtbec31n3n7UnKuLpyUByREid1pQu2kSqoTBvmPunw4JR5L+YPwn56dwIouxbt+K8uwlW+e59ppraiQpJLfI9XKj4zpSmCaLZmJcXYV3kEitlh6LM7b8k4Nyk5G17FjCPK0cQ3nak0cEllr5+u+zija3cpcZ21vEZ997XSCF5OOi977ytLx7dXD0Xtcx91GnP4JOXOUuu4pPYTpJJSs0DB+f//SFEaTY9Few1AEr8NQ73+0sO+0nFA6kk22K9+vwAdk+VCo+xYA9BvVcMHuKg7Xb1/18Jwj8HftEabsOasYYK3PEZWfKAqUDHeNHaaqB3x2e+sOVnqYPl78mqiLT0ANTegX5mV0L/TRzNO9kNe+A89s5wbOn4iUnXEOBteVaspkqkhflA1kU9Aemz1I7IypwX4xAZ/EPYu9FJwQdAG9z/QTsigvwLp6zGuCfmXA8KMgZ4TknkGVXm6BEeXasK89fY1Pjm0lYEOXsU9UyVci09aYSAMASl6U46J9W0PEZb3UHX7BRN5nmx/wuv1pWimOfxTAr8xGnA0celZQQOQP7thRP2R/2NzVqL44QeOQtzbiLCnpYHZoUQbDwgbR5zheLeMRlcHr/17aGInLpA25pS58J/XbqPCauiHJhbDQ== smoyer1@smoyer1-xps15l",
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCYjYtlfnbeOaHwr0KCJdff37Oug9qMKkYymmAlMb8iERhtljHXGvzNQ56hemw8Zwk4e5i9eGkPjX3vcuuH3X+1FcSWJNzNXC3LnRsnHZPEZpd4DU1nIK7hC3KCgcD9843yOLmnalvtO/Nk88XE49TRWkGIcZffai5/tDthGnU1urY+0IQrX1EMC80sfEYzo7zYXirs92YLBT5uFy8iRs5bYPWiyfjUplzI6kmFpICAxyMhkHQSELrkUbCMAvF5M0MNZ1XsCHAQA97ovyDct6GocuGUXQkVkUQ/WARwoGu4SucMhbkSXJgWuXkvP4vRb/zgAJoPFpIbO4VQIPyNLARijkqXIqwS4wS1Vb6TNAOptOVb5FIjaH9wIPZN3uip3qckbf+hx7XeI0gXas+oa0U4Wt46Oc7jYDVysUCI9MoVClBh5/mgPgDqoQVjYiYAnMvL0EKCptYkmpFE3kn1hPYw015asZIdqplyktZoD4Q4RpVKFetN+/Q9TBCrRr/nq0c= env0"
  ]

  group      = "redirectors"
  tags       = var.instance.tags
  swap_size  = 256
  private_ip = false
}

resource "ansible_playbook" "this" {
  name     = linode_instance.this.ip_address
  playbook = "../modules/redirector/playbook.yaml"
  # verbosity = 6
  extra_vars = {
    primary_domain = var.primary_domain
    alias_domains  = jsonencode(var.alias_domains)
  }
}
