#!/bin/bash

USER=$1

# Create users
useradd --no-create-home --shell $(which bash) --groups sudo deploy
useradd -m --shell $(which bash) --groups sudo $USER

# Allow passwordless sudo for all
echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

# Setup local user SSH
mkdir /home/$USER/.ssh
touch /home/$USER/.ssh/authorized_keys
cat /tmp/provision/id_rsa.pub > /home/$USER/.ssh/authorized_keys
chmod -R 700 /home/$USER/.ssh
chown -R $USER:$USER /home/$USER/.ssh

# Force SSH Host Keys
rm -rf /etc/ssh/ssh_host_*
cd /tmp/provision && tar xfz ssh_keys.tar.gz
cp /tmp/provision/ssh_keys/* /etc/ssh/

# Install Python for Ansible
apt-get update
apt-get install -y python

# Clean up
rm -rf /tmp/provision
