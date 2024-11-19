# Создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = "${var.vpc_name}-ru-central1-a"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.default_cidr[0]]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "${var.vpc_name}-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.default_cidr[1]]
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name_test
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.subnet_zones_test
  subnet_ids     = [yandex_vpc_subnet.develop_a.id, yandex_vpc_subnet.develop_b.id]
  instance_name  = var.vm_web_name
  instance_count = var.vm_web_count
  image_family   = var.image_family
  public_ip      = true

  labels = {
    owner   = var.owner_label,
    project = var.project_label
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name_stage
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.subnet_zones_stage
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.vm_db_name
  instance_count = var.vm_db_count
  image_family   = var.image_family
  public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

#Пример передачи cloud-config в ВМ для демонстрации №3
#data "template_file" "cloudinit" {
#  template = file("./cloud-init.yml")
#}
data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yaml")
}
