output "redirector_ip" {
  value = module.redirector.ip
}

output "ansible_stdout" {
  value = module.redirector.stdout
}

output "ansible_stderr" {
  value = module.redirector.stderr
}
