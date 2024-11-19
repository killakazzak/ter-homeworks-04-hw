output "metadata" {
  value = "\n${data.template_file.cloudinit.rendered}"
}

output "userdata" {
  value = "\n${data.template_file.cloudinit.rendered}"
}
