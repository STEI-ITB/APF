# APF - Intel DPDK Implementation in Open vSwitch
Script needed to create Open vSwitch-DPDK in multiport-LAN  PC

### References:

* [OvS Docs](http://docs.openvswitch.org/en/latest/intro/install/dpdk/)
* [Intel Docs for Ubuntu](https://software.intel.com/en-us/articles/set-up-open-vswitch-with-dpdk-on-ubuntu-server)
* [Intel Docs for Fedora](https://software.intel.com/en-us/articles/using-open-vswitch-with-dpdk-for-inter-vm-nfv-applications)

For Ubuntu installation, OvS-DPDK will use stable version because it is installed via Ubuntu Package `apt`

While for other Linux distro, such as Fedora, it has to be built from source.

If you want to use the most recent version, please follow the build instruction from the [references](#references)).
This repo will use **Open vSwitch 2.9.2** and **DPDK 17.11**

#TODO:

*Create script for non-Ubuntu installation
*Edit grub file automatically with `perl` or `sed`