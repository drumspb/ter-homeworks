resource "yandex_compute_disk" "storage_disks" {
  count = 3
  name   = "storage-disk-${count.index}"
  size   = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  metadata = merge(var.vms_metadata["default"], {
    "ssh-keys" = local.ssh_key
  })

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

    dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disks

    content {
      disk_id = secondary_disk.value.id
    }
  }

      boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

    network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_image_nat
  }
}  