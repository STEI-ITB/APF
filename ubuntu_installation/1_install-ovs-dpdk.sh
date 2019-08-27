#!/bin/bash

sudo apt -y install openvswitch-switch-dpdk
sudo update-alternatives --set ovs-vswitchd /usr/lib/openvswitch-switch-dpdk/ovs-vswitchd-dpdk
sudo systemctl restart openvswitch-switch.service
