variable "network_name" {
  description = "Название сети"
  type        = string
}

variable "zone" {
  description = "Зона, в которой будет создана подсеть"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR блок для подсети"
  type        = string
}
