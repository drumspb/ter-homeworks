module "vpc_dev" {
  source        = "./vpc"
  network_name  = "vpc"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
}

data template_file "userdata" {
  template = file("./cloud-init.yml")

  vars = {
    username           = var.username
    ssh_public_key     = file(var.vms_ssh_root_key)
  }
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = module.vpc_dev.vpc_network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = module.vpc_dev.subnet_id
  instance_name  = "webs"
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.userdata.rendered
    serial-port-enable = 1
  }

}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
  network_id     = module.vpc_dev.vpc_network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = module.vpc_dev.subnet_id
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = "analytics"
     }  

  metadata = {
    user-data          = data.template_file.userdata.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

