### Cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

### Common vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "ssh-keygen -t ed25519"
}

### Example VM Web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

variable "vm_web_count" {
  type        = number
  default     = 2
  description = "Number of web instances"
}

### Example VM DB var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
}

variable "vm_db_count" {
  type        = number
  default     = 1
  description = "Number of db instances"
}

### Environment variables
variable "env_name_test" {
  type        = string
  default     = "develop"
  description = "Environment name for test VM"
}

variable "env_name_stage" {
  type        = string
  default     = "stage"
  description = "Environment name for stage VM"
}

variable "subnet_zones_test" {
  type        = list(string)
  default     = ["ru-central1-a", "ru-central1-b"]
  description = "Subnets for test VM"
}

variable "subnet_zones_stage" {
  type        = list(string)
  default     = ["ru-central1-a"]
  description = "Subnets for stage VM"
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
