# clementd64's Archlinux setup

## Disclaimer

The target machine must be EFI-capable since EFISTUB is used and no additional bootloader will be installed.

## Installation

1. add your machine in the `inventory.yml`
2. boot archiso and run
```sh
loadkeys fr                                                      # load french keyboard
iwctl                                                            # configure the wifi if needed
mount -o remount,size=4G /run/archiso/cowspace                   # resize the root partition (required to install ansible)
pacman --noconfirm -Sy ansible git                               # install ansible and git
git clone https://github.com/clementd64/ansible-arch-install.git # clone the repo
cd ansible-arch-install                                          # go to the repo
ansible-playbook -i inventory.yml install.yml -l MACHINE         # run the playbook
```