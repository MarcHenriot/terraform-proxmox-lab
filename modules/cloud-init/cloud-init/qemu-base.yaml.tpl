#cloud-config
fqdn: ${fqdn}
users:
- default
- name: ubuntu
  groups:
  - sudo
  shell: /bin/bash
  ssh_authorized_keys:
  - ${ssh_public_key}
  sudo: ALL=(ALL) NOPASSWD:ALL
package_update: true
package_upgrade: true
packages:
- qemu-guest-agent
runcmd:
- timedatectl set-timezone America/Toronto
- systemctl enable qemu-guest-agent
- systemctl start qemu-guest-agent
- echo "done" > /tmp/cloud-config.done
