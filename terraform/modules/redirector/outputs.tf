output "ip" {
  value = linode_instance.this.ip_address
}

output "stdout" {
  value = ansible_playbook.this.ansible_playbook_stdout
}

output "stderr" {
  value = ansible_playbook.this.ansible_playbook_stderr
}
