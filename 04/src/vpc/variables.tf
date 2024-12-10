variable "network_name" {
  description = "Название сети"
  type        = string
}

variable "subnets" {
  description = "Список подсетей с зонами и CIDR-блоками"
  type = list(object({
    zone = string
    cidr = string
  }))
}
