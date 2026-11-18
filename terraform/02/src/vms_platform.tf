# ============================================================
# Переменные первой ВМ (web) — перенесены из variables.tf
# ============================================================

variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v2"
}

variable "vm_web_zone" {
  type    = string
  default = "ru-central1-a"
}

# --- закомментировано в задании 6 (заменено на var.vms_resources["web"]) ---
# variable "vm_web_cores" {
#   type    = number
#   default = 2
# }

# variable "vm_web_memory" {
#   type    = number
#   default = 1
# }

# variable "vm_web_core_fraction" {
#   type    = number
#   default = 5
# }

# variable "vm_web_disk_type" {
#   type    = string
#   default = "network-hdd"
# }

# variable "vm_web_disk_size" {
#   type    = number
#   default = 5
# }
# ---

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_preemptible" {
  type    = bool
  default = true
}

variable "vm_web_nat" {
  type    = bool
  default = true
}

# ============================================================
# Переменные второй ВМ (db)
# ============================================================

variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v2"
}

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-d"
}

# --- закомментировано в задании 6 (заменено на var.vms_resources["db"]) ---
# variable "vm_db_cores" {
#   type    = number
#   default = 2
# }

# variable "vm_db_memory" {
#   type    = number
#   default = 2
# }

# variable "vm_db_core_fraction" {
#   type    = number
#   default = 20
# }

# variable "vm_db_disk_type" {
#   type    = string
#   default = "network-hdd"
# }

# variable "vm_db_disk_size" {
#   type    = number
#   default = 10
# }

# variable "vm_db_image_family" {
#   type    = string
#   default = "ubuntu-2004-lts"
# }
# ---

variable "vm_db_preemptible" {
  type    = bool
  default = true
}

variable "vm_db_nat" {
  type    = bool
  default = true
}