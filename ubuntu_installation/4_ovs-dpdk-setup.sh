#!/bin/bash

#Setting OvS to use DPDK at start
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true

#Setting OvS-DPDK Parameter for this system
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-lcore-mask=0xe
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-socket-mem="1024"
sudo ovs-vsctl set Open_vSwitch . other_config:pmd-cpu-mask=0x2
