resource "local_file" "ansible_inventory" {
  filename = "./inventory_test"
  content  = templatefile("${path.module}/hosts.tftpl", {
    webservers = yandex_compute_instance.web,
    databases  = yandex_compute_instance.db,
    storage    = (yandex_compute_instance.storage != null ? [yandex_compute_instance.storage] : []),
  })
}
