variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "zone" {
  description = "Zone for the subnet"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR block for the subnet"
  type        = string
}
