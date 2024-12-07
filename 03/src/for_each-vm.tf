resource "yandex_compute_instance" "db" {
  for_each = { for k, v in var.vms_resources : k => v if k == "main" || k == "replica" }
  
  name        = each.key                       
  platform_id = var.vm_web_platform_id
  metadata = merge(var.vms_metadata["default"], {
    "ssh-keys" = local.ssh_key
  })

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_image_scheduling
  }

  network_interface {
    subnet_id             = yandex_vpc_subnet.develop.id
    nat                   = var.vm_web_image_nat
    security_group_ids    = [yandex_vpc_security_group.example.id]
  }
}
