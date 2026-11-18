###cloud vars

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

# --- закомментировано в задании 6 (не используется) ---
# variable "default_cidr" {
#   type        = list(string)
#   default     = ["10.0.1.0/24"]
#   description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
# }
#
# variable "vpc_name" {
#   type        = string
#   default     = "develop"
#   description = "VPC network & subnet name"
# }
# ---

###ssh vars

variable "vms_ssh_public_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGPv9t9EI/zZlyzI51XgR03okBYlxZNRI8GlgFje7v/0 avdey@MacBookPro"
  description = "ssh-keygen -t ed25519"
}

### task 6: map-переменные для ресурсов и metadata

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))

  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
      hdd_size      = 5
      hdd_type      = "network-hdd"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      hdd_size      = 10
      hdd_type      = "network-hdd"
    }
  }
}

variable "metadata" {
  type = map(string)
  default = {
    serial-port-enable = "1"
  }
}