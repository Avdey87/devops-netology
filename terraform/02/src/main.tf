data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

resource "yandex_vpc_network" "develop" {
  name = "develop"
}

resource "yandex_vpc_subnet" "develop" {
  name           = "develop"
  zone           = var.vm_web_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-b"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

resource "yandex_compute_instance" "platform" {
  name        = local.web_name
  platform_id = var.vm_web_platform_id
  zone        = var.vm_web_zone

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vms_resources["web"].hdd_type
      size     = var.vms_resources["web"].hdd_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
  }

  metadata = merge(var.metadata, {
    ssh-keys = "ubuntu:${var.vms_ssh_public_root_key}"
  })

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
}

resource "yandex_compute_instance" "db" {
  name        = local.db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vms_resources["db"].hdd_type
      size     = var.vms_resources["db"].hdd_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = var.vm_db_nat
  }

  metadata = merge(var.metadata, {
    ssh-keys = "ubuntu:${var.vms_ssh_public_root_key}"
  })

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
}