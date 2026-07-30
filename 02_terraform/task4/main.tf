#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
#создаем облачную подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
variable "enable_oslogin" {
  type    = bool
  default = false
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

#vm-1
module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = "${var.vm_labels[0]}-${var.default_vm_instance.name}"
  instance_count =  1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false

  labels = {
    owner= var.vm_user,
    project = var.vm_labels[0]
 }
  metadata = {
    user_data = templatefile("${path.module}/cloud-init.yml", {
    vm_user = var.vm_user
    ssh_public_key = var.ssh_public_key
  })
    serial-port-enable = 1
    enable-oslogin = false
  }
}

##vm2
module "analytic-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = ["ru-central1-b"]
  subnet_ids     = [yandex_vpc_subnet.develop_b.id]
  instance_name  = "${var.vm_labels[1]}-${var.default_vm_instance.name}"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false

  labels = {
    owner= var.vm_user,
    project = var.vm_labels[1]
 }

  metadata = {
    enable-oslogin = var.enable_oslogin ? "trBBue" : null
    user_data = templatefile("${path.module}/cloud-init.yml", {
    vm_user = var.vm_user
    ssh_public_key = var.ssh_public_key
  })
    serial-port-enable = 1
  }
}
