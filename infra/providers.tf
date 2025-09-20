terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_api_url
  username  = var.proxmox_user
  api_token = var.proxmox_token
  insecure  = true
}