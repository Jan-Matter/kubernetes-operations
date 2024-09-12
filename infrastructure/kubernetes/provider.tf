provider "hcloud" {
  token = "${var.HCLOUD_API_TOKEN}"
}

terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
  required_version = ">= 1.9.5"
}