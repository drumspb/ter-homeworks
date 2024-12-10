output "vpc_network_id" {
  description = "ID созданной VPC-сети"
  value       = yandex_vpc_network.vpc_network.id
}

output "subnet_id" {
  value = values({ for k, v in yandex_vpc_subnet.vpc_subnet : k => v.id })  # Преобразуем карту в список
}


