output "metadata" {
  value = "\n${data.template_file.cloudinit.rendered}"
}

output "userdata" {
  value = "\n${data.template_file.cloudinit.rendered}"
}
output "subnet_id" {
  value = module.vpc_dev.subnet_id
}
