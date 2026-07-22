locals {
  vm_web_name = "${var.vm_web_name}-${data.yandex_compute_image.ubuntu.family}"
  vm_db_name = "${var.vm_db_name}-${data.yandex_compute_image.ubuntu.family}"
}
