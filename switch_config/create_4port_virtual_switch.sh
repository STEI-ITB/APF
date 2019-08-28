#!/bin/bash

#Purge switch that named brDPDK
sudo ovs-vsctl del-br brDPDK

#Create switch named brDPDK with 4 ports named vhost-user$NUMBER
sudo ovs-vsctl add-br brDPDK -- set bridge brDPDK datapath_type=netdev
sudo ovs-vsctl add-port brDPDK vhost-user1 -- set Interface vhost-user1 type=dpdk-vhostuser
sudo ovs-vsctl add-port brDPDK vhost-user2 -- set Interface vhost-user2 type=dpdk-vhostuser
sudo ovs-vsctl add-port brDPDK vhost-user3 -- set Interface vhost-user3 type=dpdk-vhostuser
sudo ovs-vsctl add-port brDPDK vhost-user4 -- set Interface vhost-user4 type=dpdk-vhostuser


