# clementd64's Archlinux setup

## Disclaimer

The target machine must be EFI-capable since EFISTUB is used and no additional bootloader will be installed.

This script don't work with ansible 2.9. If you have ansible 2.9 installed, use can use the `install-with-docker.sh` script for a Docker based installation.

## Installation

1. add your machine in the `inventory.yml`
2. boot archiso and run
```sh
loadkeys fr          # load french keyboard
iwctl                # configure the wifi if needed
systemctl start sshd # start the ssh daemon
passwd               # set the root password for ssh access
ip a                 # get the ip address
```
3. copy your ssh key `$ ssh-copy-id root@MACHINE_IP`
4. `$ ansible-playbook -i inventory.yml install.yml -l MACHINE_NAME -e ansible_host=MACHINE_IP`  
or `$ script/install-with-docker.sh -l MACHINE_NAME -e ansible_host=MACHINE_IP`