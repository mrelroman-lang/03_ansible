###6
variable "vms_resources" {
  type = map(map(number))
  description = "Resources configuration for vm"
  default = {
    vm_web_resources = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
    vm_db_resources = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}
###yandex_compute 1
 variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}
 variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex_compute_instance platform"
}
 variable "vm_web_platform" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_instance platform id"
}
 variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "yandex_compute_instance zone"
}
# variable "vm_web_core" {
#  type        = number
#  default     = "2"
#  description = "yandex_compute_instance resources cores"
#}
# variable "vm_web_mem" {
#  type        = number
#  default     = "2"
#  description = "yandex_compute_instance resources memory"
#}
# variable "vm_web_crfr" {
#  type        = number
#  default     = "20"
#  description = "yandex_compute_instance resources core_fraction"
#}
 variable "vm_web_preem" {
  type        = bool
  default     = "true"
  description = "yandex_compute_instance resources preemptible"
}
 variable "vm_web_nat" {
  type        = bool
  default     = "true"
  description = "yandex_compute_instance resources nat"
}

###yandex_compute 2

 variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}
 variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "yandex_compute_instance platform"
}
 variable "vm_db_platform" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_instance platform id"
}
 variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "yandex_compute_instance zone"
}
# variable "vm_db_core" {
#  type        = number
#  default     = "2"
#  description = "yandex_compute_instance resources cores"
#}
# variable "vm_db_mem" {
#  type        = number
#  default     = "2"
#  description = "yandex_compute_instance resources memory"
#}
# variable "vm_db_crfr" {
#  type        = number
#  default     = "20"
#  description = "yandex_compute_instance resources core_fraction"
#}
 variable "vm_db_preem" {
  type        = bool
  default     = "true"
  description = "yandex_compute_instance resources preemptible"
}
 variable "vm_db_nat" {
  type        = bool
  default     = "true"
  description = "yandex_compute_instance resources nat"
}
