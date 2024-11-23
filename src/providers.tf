terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
  required_version = "~>1.8.4"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

terraform {
  backend "s3" {
    shared_credentials_files    = ["~/.aws/credentials"]
    shared_config_files         = ["~/.aws/config"]
    profile                     = "default"
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    skip_credentials_validation = true
    region                      = "us-east-1"
    bucket                      = "tenda-bucket"
    key                         = "test/terraform.tfstate"
    endpoints = {
      dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gp6qjp3sreksmq9ju1/etn18ov3v7lqujj1kurl"
      s3       = "https://storage.yandexcloud.net"
    }
    dynamodb_table = "tfstatelock"
  }
}
