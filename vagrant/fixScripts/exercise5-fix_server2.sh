#!/bin/bash
#add fix to exercise5-server2 here
# Install sshpass for quiet transfer of ssh key
apt-get install sshpass -f
# Generate RSA pair
su vagrant -c 'ssh-keygen -t rsa -q -N "" -f /home/vagrant/.ssh/id_rsa'

# chowning to vagrant
chown -R vagrant:vagrant /home/vagrant/.ssh/*

# Allow SSH connection without host key checking
echo "Host server1" >> ~vagrant/.ssh/config
echo "  StrictHostKeyChecking no" >> ~vagrant/.ssh/config

# Transfer the ssh key
su vagrant -c 'sshpass -p vagrant ssh-copy-id vagrant@server1'

#copy the ssh key from server1 to server2
su vagrant -c 'ssh server1 sshpass -p vagrant ssh-copy-id vagrant@server2'