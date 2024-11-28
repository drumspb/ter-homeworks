output "instances_info" {
  value = {
    Name_web = yandex_compute_instance.platform_web.name
    Ip_external_web = yandex_compute_instance.platform_web.network_interface[0].nat_ip_address
    FQDN_web = "${yandex_compute_instance.platform_web.name}.${var.fqdn_domain}"

    Name_db = yandex_compute_instance.platform_db.name
    Ip_external_db = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
    FQDN_db = "${yandex_compute_instance.platform_db.name}.${var.fqdn_domain}"
  }
  description = "Information about all instances, including name, external IP, and FQDN."
}