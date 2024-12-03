###vm vars

variable "vms_resources" {
  description = "Resources for virtual machines"
  type = map(object({
    cores          = number
    memory         = number
    core_fraction  = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 4
      core_fraction = 50
    }
    db = {
      cores         = 4
      memory        = 8
      core_fraction = 100
    }
  }
}

variable "vms_metadata" {
  description = "Metadata for all virtual machines"
  type = map(object({
    serial_port_enable = number
    ssh_keys           = string
  }))
  default = {
    default = {
      serial_port_enable = 1
      ssh_keys           = "ubuntu:${var.vms_ssh_root_key}"
    }
  }
}

variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v3"
}

# variable "vm_web_cores" {
#   type    = number
#   default = 2
# }

# variable "vm_web_memory" {
#   type    = number
#   default = 2
# }

# variable "vm_web_core_fraction" {
#   type    = number
#   default = 20
# }

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_image_scheduling" {
  type    = bool
  default = true
}

variable "vm_web_image_nat" {
  type    = bool
  default = true
}

variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v3"
}

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

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "vm_db_image_scheduling" {
  type    = bool
  default = true
}

variable "vm_db_image_nat" {
  type    = bool
  default = true
}

