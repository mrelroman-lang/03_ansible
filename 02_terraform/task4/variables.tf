###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}
variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "vm_user" {
  type        = string
  description = "VM user name"
}

##common vars
variable "vm_db_nat" {
  type        = bool
  default     = "false"
  description = "yandex_compute_instance resources nat"
 } 

##yandex_compute default
 variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}
variable "default_boot_disk" {
  type = object({
    core_fraction = number
    size          = number
    type          = string
  })
  default = {
    core_fraction = 5
    size = 5
    type = "network-hdd"
  }
}
variable "default_vm_instance" {
  type = object({
    name	  = string
    disk_type     = string
    disk_size     = number
    platform_id   = string
    preemptible   = bool
    cores         = number
    memory        = number
    core_fraction = number
    nat           = bool
  })
  default = {
    name	  = "ubuntu"
    disk_type     = "network-hdd"
    disk_size     = 5
    platform_id   = "standard-v1"
    preemptible   = true
    cores         = 2
    memory        = 1
    core_fraction = 5
    nat           = false
  }
}

##label
variable "vm_labels" {
  type = list(string)
  default = [
    "marketing",
    "analitics"
  ]
}

##ssh
variable "ssh_key" {
  type      = string
  sensitive = true
}
variable "ssh_public_key" {
  type = list(string)
  default = [ 
    "/home/roman/.ssh/id_ed25519.pub",
    "/home/roman/.ssh/id_rsa.pub"
    ]
  description = "ssh-keygen -t ed25519"
}