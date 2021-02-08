# Ansible
Used to provision local VMs and remote infrastructure.

## Playbooks
* `playbook-local.yaml` - used to setup Vagrant VM
* `playbook-{hw#}.yaml` - used to deploy homework to VPS

## Running
```sh
ansible-playbook -i hosts site.yaml --user baustin
```
