We need to edit some files so OvS-DPDK can operates.

1. First, we need to allocate how much hugepages needed for our system. Here is [reference](https://developers.redhat.com/blog/2018/03/16/ovs-dpdk-hugepage-memory/) to allocate how much hugepages needed to be allocated. For this case, we use **8GB** of hugepages.

    > **8GB** of hugepages in this case is going to be splitted into 4GB of 1GB hugepages (*4 x 1G*) and 4GB of 2MB hugepages (*2048 x 2MB*).
    >
    > If your system only support 2MB hugepages, you can use all of it for 2MB hugepages (*4096 x 2MB*)

2. Edit this file on `/etc/default/grub`.

    ```
GRUB_CMDLINE_LINUX_DEFAULT="default_hugepagesz=1G hugepagesz=1G hugepages=4 hugepagesz=2M hugepages=2048"
    ```

    > For PC that only supports 2MB hugepages:

    ```
GRUB_CMDLINE_LINUX_DEFAULT="default_hugepagesz=2M hugepagesz=2M hugepages=4096"
    ```

3. Edit this file on `/etc/dpdk/dpdk.conf`

    ```
NR_1G_PAGES=4
    ```

    ```
NR_2M_PAGES=2048
    ```

    > For PC that only supports 2MB hugepages:

    ```NR_2M_PAGES=4096```

4. After that run:

    ```
sudo update-grub
    ```

    ```
sudo reboot
    ```

5. Next step is setting OvS-DPDK parameter. For more info about the parameters, it is explained [here](https://developers.redhat.com/blog/2017/06/28/ovs-dpdk-parameters-dealing-with-multi-numa/)