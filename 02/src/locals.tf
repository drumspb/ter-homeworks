locals {
  web_name = "${var.vm_web_name}_${var.vm_web_image_family}"
  db_name  = "${var.vm_db_name}_${var.vm_web_image_family}"
}