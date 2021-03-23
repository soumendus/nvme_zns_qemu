qemu-system-x86_64 -m 4096M -smp 4 -hda fed3340.qcow2 \
	-enable-kvm \
	-drive file=./zns_ssd.img,id=disk1,format=raw,if=none \
        -device nvme,serial=deadbeaf1,id=nvme0,max_ioqpairs=4 \
        -device nvme-ns,zoned=true,id=ns1,drive=disk1,bus=nvme0,nsid=1,zoned.zone_size=131072,zoned.zone_capacity=131072,zoned.max_open=0,zoned.max_active=0,logical_block_size=4096,physical_block_size=4096 \
        -nic user,id=eth0,net=192.168.1.0/24,dhcpstart=192.168.1.1,hostfwd=tcp::2222-:22,model=virtio-net-pci,hostname=zns
