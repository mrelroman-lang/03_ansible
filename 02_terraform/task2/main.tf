resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop-a" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a" #Это очень важно  при создании ресурса в зоне отличной от Зоны по-умолчанию("ru-central1-a")! 
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
#создаем облачную подсеть zone B
resource "yandex_vpc_subnet" "develop-b" {
  name           = "develop-ru-central1-b"
  zone           = "ru-central1-b" #Это очень важно  при создании ресурса в зоне отличной от Зоны по-умолчанию("ru-central1-b")! 
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}
data "yandex_compute_image" "ubuntu" {
   family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform
  zone = "ru-central1-a"
  resources {
    cores = var.vms_resources.vm_web_resources.cores
    memory = var.vms_resources.vm_web_resources.memory
    core_fraction = var.vms_resources.vm_web_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preem
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = var.vm_web_nat
  }

  metadata = var.vm_metadata
# {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }

}
resource "yandex_compute_instance" "platform-db" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform
  zone = "ru-central1-b"
  resources {
    cores = var.vms_resources.vm_db_resources.cores
    memory = var.vms_resources.vm_db_resources.memory
    core_fraction = var.vms_resources.vm_db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preem
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = var.vm_db_nat
  }

  metadata = var.vm_metadata
#  {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }

}