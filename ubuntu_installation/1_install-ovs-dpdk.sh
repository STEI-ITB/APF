#!/bin/bash

sudo apt -y install openvswitch-switch-dpdk
sudo update-alternatives --set ovs-vswitchd /usr/lib/openvswitch-switch-dpdk/ovs-vswitchd-dpdk
sudo apt -y install dpdk-igb-uio-dkms
sudo systemctl restart openvswitch-switch.service
