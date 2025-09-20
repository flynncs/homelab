# Homelab (Proxmox + OpenTofu + Ansible + Komodo)

This repo declares and manages:
- **infra/**: Proxmox VMs/LXCs via **OpenTofu**
- **ansible/**: host config, Docker install, apt updates
- **apps/**: Docker stacks managed by **Komodo**
- **docs/**: runbooks, inventory templates

All secrets are passed via env vars or Ansible Vault; nothing sensitive should be committed.
