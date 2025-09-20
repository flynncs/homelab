variable "proxmox_api_url" {
  description = "Proxmox API endpoint"
  type        = string
  default     = "https://10.0.0.1:8006/api2/json"
}
variable "proxmox_user" {
  description = "Proxmox user (e.g., root@pam!tofu)"
  type        = string
}
variable "proxmox_token" {
  description = "Proxmox API token value"
  type        = string
  sensitive   = true
}

# ---- Proxmox environment defaults ----
variable "node" {
  description = "Proxmox node name"
  default     = "homelab"
}
variable "bridge" {
  description = "Linux bridge for VMs"
  default     = "vmbr0"
}
variable "datastore_vm" {
  description = "Storage for VM disks"
  default     = "local"
}
variable "datastore_ci" {
  description = "Storage for cloud-init"
  default     = "local"
}

# ---- Network ----
variable "gateway" {
  description = "Default gateway"
  default     = "10.0.0.1"
}
variable "cidr" {
  description = "CIDR suffix for static IPs"
  default     = "/24"
}

# ---- Template & access ----
variable "template_id" {
  description = "VMID of the cloud-init template"
  type        = number
  default     = 9000
}
variable "ssh_pub_key_path" {
  description = "Path to SSH public key to inject via cloud-init"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}
variable "ci_user" {
  description = "Initial cloud-init user (non-root)"
  type        = string
  default     = "flynn"
}
variable "ci_password" {
  description = "Initial password for ci_user (optional if using keys)"
  type        = string
  default     = "CHANGE-ME"
  sensitive   = true
}