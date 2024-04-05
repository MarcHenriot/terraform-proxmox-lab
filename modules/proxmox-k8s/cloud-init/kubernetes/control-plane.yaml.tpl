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
apt:
  sources:
    kubernetes.list:
      source: 'deb [signed-by=$KEY_FILE] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /'
      # https://stackoverflow.com/questions/72620609/cloud-init-fetch-apt-key-from-remote-file-instead-of-from-a-key-server
      keyid: DE15B14486CD377B9E876E1A234654DA9A296436
      filename: kubernetes.list
package_update: true
package_upgrade: true
packages:
- qemu-guest-agent
- net-tools
- containerd
- kubelet
- kubeadm
- kubectl
- firewalld
write_files:
- path: /etc/modules-load.d/k8s.conf
  content: |
    overlay
    br_netfilter
- path: /etc/sysctl.d/k8s.conf
  content: |
    net.bridge.bridge-nf-call-iptables  = 1
    net.bridge.bridge-nf-call-ip6tables = 1
    net.ipv4.ip_forward                 = 1
runcmd:
- timedatectl set-timezone America/Toronto
- systemctl enable qemu-guest-agent
- systemctl start qemu-guest-agent
# K8S - firewall =================================
- firewall-cmd --permanent --set-target=ACCEPT
%{ if !worker ~}
- firewall-cmd --permanent --add-port=6443/tcp # k8s
- firewall-cmd --permanent --add-port=2379-2380/tcp
- firewall-cmd --permanent --add-port=10259/tcp
- firewall-cmd --permanent --add-port=10257/tcp
%{ else ~}
- firewall-cmd --permanent --add-port=30000-32767/tcp
%{ endif ~}
- firewall-cmd --permanent --add-port=10250/tcp
- firewall-cmd --permanent --add-port=179/tcp # Calico
- firewall-cmd --permanent --add-port=4789/udp
- firewall-cmd --permanent --add-port=5473/tcp
- firewall-cmd --permanent --add-port=51820/udp
- firewall-cmd --permanent --add-port=51821/udp
- firewall-cmd --permanent --add-interface=vxlan.calico
- firewall-cmd --permanent --add-interface="cali+"
- firewall-cmd --permanent --add-interface="tunl+"
- firewall-cmd --reload
# K8S - PREINSTALL ==============================
- apt-mark hold kubelet kubeadm kubectl
- swapoff -a
- modprobe overlay
- modprobe br_netfilter
- sysctl --system
- mkdir -p /etc/containerd
- containerd config default | tee /etc/containerd/config.toml
- sed -i 's/            SystemdCgroup = false/            SystemdCgroup = true/' /etc/containerd/config.toml
- systemctl restart containerd
- systemctl enable --now kubelet
- kubeadm config images pull
# K8S - INSTALL =================================
%{ if worker ~}
- |
  until kubeadm join ${kubeadm_cp_endpoit} --token ${kubeadm_token} --discovery-token-unsafe-skip-ca-verification; do
    sleep 20
  done
%{ else ~}
%{ if index == "cp-0" ~}
- kubeadm init --pod-network-cidr=10.10.0.0/16 --control-plane-endpoint ${kubeadm_cp_endpoit} --upload-certs --token ${kubeadm_token} --certificate-key ${kubeadm_certificate_key}
- |
  curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/calico.yaml -O
  sed -i '/# - name: CALICO_IPV4POOL_CIDR/,/#   value: "192.168.0.0\/16"/s/# //' calico.yaml
  sed -i 's/192.168.0.0\/16/10.10.0.0\/16/' calico.yaml
- KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f calico.yaml
%{ else ~}
- |
  until kubeadm join ${kubeadm_cp_endpoit} --control-plane --token ${kubeadm_token} --certificate-key ${kubeadm_certificate_key} --discovery-token-unsafe-skip-ca-verification; do
    sleep 20
  done
%{ endif ~}
%{ endif ~}
- mkdir -p /home/ubuntu/.kube
- cp -i /etc/kubernetes/admin.conf /home/ubuntu/.kube/config
- chown ubuntu:ubuntu /home/ubuntu/.kube/config
- echo "done" > /tmp/cloud-config.done