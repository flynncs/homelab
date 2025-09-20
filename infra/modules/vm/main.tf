resource "proxmox_virtual_environment_vm" "vm" {
  name        = var.name
  node_name   = var.node
  description = var.description

  clone {
    vm_id = var.template_id
    full  = true
  }

  cpu { cores = var.cores }
  memory { dedicated = var.memory_mb }

  disk {
    interface    = "scsi0"
    datastore_id = var.datastore_vm
    size         = var.disk_gb
  }

  network_device {
    model  = "virtio"
    bridge = var.bridge
  }

  agent { enabled = true }

  initialization {
    datastore_id = var.datastore_ci
    user_account {
      username = var.ci_user
      password = var.ci_password
      keys     = [file(var.ssh_pub_key_path)]
    }
    ip_config {
      ipv4 {
        address = "${var.ip}${var.cidr}"
        gateway = var.gateway
      }
    }
  }
}

output "ip" {
  value = proxmox_virtual_environment_vm.vm.ipv4_addresses[0]
}