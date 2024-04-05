#cloud-config
fqdn: ha-proxy
write_files:
- path: /etc/haproxy/haproxy.cfg
  content: |
    #---------------------------------------------------------------------
    # Global settings
    #---------------------------------------------------------------------
    global
        log /dev/log local0
        log /dev/log local1 notice
        chroot      /var/lib/haproxy
        pidfile     /var/run/haproxy.pid
        maxconn     4000
        user        haproxy
        group       haproxy
        daemon

    #---------------------------------------------------------------------
    # common defaults that all the 'listen' and 'backend' sections will
    # use if not designated in their block
    #---------------------------------------------------------------------
    defaults
        log                     global
        option                  httplog
        option                  dontlognull
        option http-server-close
        option forwardfor       except 127.0.0.0/8
        option                  redispatch
        retries                 2
        timeout connect         5s
        timeout client          50s
        timeout server          50s
        # timeout http-keep-alive 10s
        # timeout check           10s
        # timeout http-request    10s
        # timeout queue           20s

    #---------------------------------------------------------------------
    # apiserver frontend which proxys to the control plane nodes
    #---------------------------------------------------------------------
    frontend apiserver
        mode tcp
        bind *:6443
        option tcplog
        default_backend kube-apiserver

    #---------------------------------------------------------------------
    # round robin balancing for apiserver
    #---------------------------------------------------------------------
    backend kube-apiserver
        mode tcp
        option httpchk
        option ssl-hello-chk
        http-check send meth GET uri /livez
        http-check expect status 200
        balance roundrobin
        default-server inter 10s downinter 5s rise 2 fall 2 slowstart 60s maxconn 250 maxqueue 256 weight 100
        server k8s-cp-0 192.168.2.170:6443 check
        server k8s-cp-1 192.168.2.171:6443 check
        server k8s-cp-2 192.168.2.172:6443 check
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
- net-tools
- haproxy
- firewalld
runcmd:
- swapoff -a
- apt-mark hold kubelet kubeadm kubectl
- timedatectl set-timezone America/Toronto
- systemctl enable qemu-guest-agent
- systemctl start qemu-guest-agent
- firewall-cmd --permanent --add-port=6443/tcp # k8s
- firewall-cmd --reload
- echo "============HA-PROXY============"
- systemctl enable haproxy --now
- echo "done" > /tmp/cloud-config.done
