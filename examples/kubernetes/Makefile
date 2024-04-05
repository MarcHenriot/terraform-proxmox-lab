VM_MODULE=module.k8s

.PHONY: destroy-vm ssh

destroy-vm:
	@terraform destroy -target $(VM_MODULE)

ssh-cp:
	@ssh-keygen -f "/home/marc/.ssh/known_hosts" -R "192.168.2.170"
	@ssh ubuntu@192.168.2.170 -i ssh/id_rsa

ssh-ha:
	@ssh-keygen -f "/home/marc/.ssh/known_hosts" -R "192.168.2.180"
	@ssh ubuntu@192.168.2.180 -i ssh/id_rsa
