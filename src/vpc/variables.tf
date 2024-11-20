variable "vpc_name" {
  description = "Имя VPC сети"
  type        = string
}

variable "default_zone" {
  description = "Зона, в которой будет создана подсеть"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR блоки для подсети"
  type        = list(string)
}
