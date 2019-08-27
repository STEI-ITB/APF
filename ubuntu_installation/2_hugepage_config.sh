#!/bin/bash

#Check whether the CPU is compatible with 1G hugepages
cpuStat=`sudo lscpu | grep -w pdpe1gb`

#If lscpu command resulted empty, then the CPU does not support 1GB hugepages
#So, use 2MB hugepages instead

#Then we create mount point for hugepages for permanent setup in /etc/fstab
#If /etc/fstab already configured with hugepages, this settings need to be
#   deleted first for clean mounting

fstabStat=`sudo grep hugepages /etc/fstab`

if [ -z "$fstabStat" ]
then
	if [ -z "$cpuStat" ]
	then
		echo "Your CPU only support 2MB hugepages"
		sudo echo "nodev /mnt/huge hugetlbfs defaults 0 0" >> /etc/fstab
		sudo echo "nodev /dev/hugepages hugetlbfs defaults 0 0" >> /etc/fstab
	else
		echo "Your CPU can support 1GB hugepages"
                sudo echo "nodev /mnt/huge hugetlbfs defaults 0 0" >> /etc/fstab
		sudo echo "nodev /mnt/huge_2mb hugetlbfs pagesize=2MB 0 0" >> /etc/fstab
                sudo echo "nodev /dev/hugepages hugetlbfs defaults 0 0" >> /etc/fstab
	fi
else
	echo "Your /etc/fstab probably already configured with hugepages. Please clean the hugepages configuration first in your /etc/fstab file."
fi
