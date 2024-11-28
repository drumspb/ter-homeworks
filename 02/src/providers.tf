terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
  # token     = var.token
  cloud_id                 = "b1golipav4ipa0ltifko" 
  folder_id                = "b1goiv8hbuqegdqk3k0r" 
  zone                     = var.default_zone
  service_account_key_file = file("~/authorized_key.json")
}
