#!/bin/bash
#add fix to exercise5-server1 here

# Install sshpass for quiet transfer of ssh key
apt-get install sshpass -f
# Generate RSA pair
su vagrant -c 'ssh-keygen -t rsa -q -N "" -f /home/vagrant/.ssh/id_rsa'

# chowning to vagrant
chown -R vagrant:vagrant /home/vagrant/.ssh/*

# Allow SSH connection without host key checking
echo "Host server2" >> ~vagrant/.ssh/config
echo "  StrictHostKeyChecking no" >> ~vagrant/.ssh/config
