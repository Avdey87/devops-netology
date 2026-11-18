locals {
  web_name = "${var.vm_web_name}-${var.vm_web_zone}"
  db_name  = "${var.vm_db_name}-${var.vm_db_zone}"
}