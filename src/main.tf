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

# Виртуальная машина для проекта marketing
module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name_marketing
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.subnet_zones_marketing
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.vm_marketing_name
  instance_count = var.vm_marketing_count
  image_family   = var.image_family
  public_ip      = true

  labels = {
    owner   = var.owner_label
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

# Виртуальная машина для проекта analytics
module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name_analytics
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.subnet_zones_analytics
  subnet_ids     = [yandex_vpc_subnet.develop_b.id]
  instance_name  = var.vm_analytics_name
  instance_count = var.vm_analytics_count
  image_family   = var.image_family
  public_ip      = true

  labels = {
    owner   = var.owner_label
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

# Шаблон для cloud-init
data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yaml")

  vars = {
    ssh_keys = join("\n", var.ssh_keys) # Преобразуем список в строку с разделением по новой строке
  }
}

