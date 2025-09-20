module "mgmt_vm" {
  source           = "./modules/vm"
  name             = "mgmt-vm"
  description      = "Komodo + Ansible controller"
  node             = var.node
  bridge           = var.bridge
  datastore_vm     = var.datastore_vm
  datastore_ci     = var.datastore_ci
  template_id      = var.template_id
  cores            = 2
  memory_mb        = 2048
  disk_gb          = 20
  ci_user          = var.ci_user
  ci_password      = var.ci_password
  ssh_pub_key_path = var.ssh_pub_key_path
  ip               = "10.0.0.150"
  cidr             = var.cidr
  gateway          = var.gateway
}

module "apps_vm_1" {
  source           = "./modules/vm"
  name             = "apps-vm-1"
  description      = "Docker host for arr/jellyseerr"
  node             = var.node
  bridge           = var.bridge
  datastore_vm     = var.datastore_vm
  datastore_ci     = var.datastore_ci
  template_id      = var.template_id
  cores            = 4
  memory_mb        = 8192
  disk_gb          = 80
  ci_user          = var.ci_user
  ci_password      = var.ci_password
  ssh_pub_key_path = var.ssh_pub_key_path
  ip               = "10.0.0.151"
  cidr             = var.cidr
  gateway          = var.gateway
}

module "tunnel_vm_v2" {
  source           = "./modules/vm"
  name             = "tunnel-vm-v2"
  description      = "Gateway v2"
  node             = var.node
  bridge           = var.bridge
  datastore_vm     = var.datastore_vm
  datastore_ci     = var.datastore_ci
  template_id      = var.template_id
  cores            = 2
  memory_mb        = 2048
  disk_gb          = 20
  ci_user          = var.ci_user
  ci_password      = var.ci_password
  ssh_pub_key_path = var.ssh_pub_key_path
  ip               = "10.0.0.152"
  cidr             = var.cidr
  gateway          = var.gateway
}

output "ips" {
  value = {
    mgmt_vm       = module.mgmt_vm.ip
    apps_vm_1     = module.apps_vm_1.ip
    tunnel_vm_v2  = module.tunnel_vm_v2.ip
  }
}
