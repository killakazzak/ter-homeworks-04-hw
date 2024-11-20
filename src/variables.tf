### Cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "Cloud ID; https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "Folder ID; https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Default availability zone; https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDR blocks for subnets; https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network and subnet name"
}

### Common vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "SSH private key for root access"
}

### Example VM Web vars
variable "vm_marketing_name" {
  type        = string
  default     = "netology-develop-platform-marketing"
  description = "VM name prefix for marketing project"
}

variable "vm_marketing_count" {
  type        = number
  default     = 2
  description = "Number of marketing instances"
}

variable "vm_analytics_name" {
  type        = string
  default     = "netology-develop-platform-analytics"
  description = "VM name prefix for analytics project"
}

variable "vm_analytics_count" {
  type        = number
  default     = 2
  description = "Number of analytics instances"
}

### Environment variables
variable "env_name_marketing" {
  type        = string
  default     = "marketing"
  description = "Environment name for marketing VM"
}

variable "env_name_analytics" {
  type        = string
  default     = "analytics"
  description = "Environment name for analytics VM"
}

variable "subnet_zones_marketing" {
  type        = list(string)
  default     = ["ru-central1-a"]
  description = "Subnets for marketing VM"
}

variable "subnet_zones_analytics" {
  type        = list(string)
  default     = ["ru-central1-b"]
  description = "Subnets for analytics VM"
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for VMs"
}

variable "owner_label" {
  type        = string
  default     = "i.ivanov"
  description = "Owner label for VMs"
}

variable "project_label" {
  type        = string
  default     = "accounting"
  description = "Project label for VMs"
}

variable "ssh_keys" {
  description = "SSH public keys for the instances"
  type        = list(string)
}
