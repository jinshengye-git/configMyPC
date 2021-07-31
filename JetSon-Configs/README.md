# JetSon Configs Collections


## flash JetPack 4.3/4.2 on Xavier/ TX2 
This is working flow about installing JetPack4.3(4.2 not tested yet) on TX2 (xavier not tested)

first prepare things:

- usb cable to HostPC
- lan cable should be pluged on TX2
- HDMI cable pluged on TX2 connecting with a displa

Then  SDKManager to Download and flash the OS

around 40%   SDKManager will ask you to manually  enter the flash mode just follow the rule it tells you to 
press the buttons on TX2.

then  after a while the TX2 will automatically launch Ubuntu 18.04 then follow the instructions to create user and password

then login the system and to ***enable your SSH  this is very important!!!***
```
#just use SSH connect any PC you have this is for creating the .ssh folder i think.
ssh xxxx@xxx.xxx.xxx.xxx
```

Then return to SDK manager to input TX2 IP and user and pwd,   keep on install the API packages 


##    Install Opencv 4.1.1
`./install_opencv4.1.1_Jetson.sh`

## fix Tx2Usb
###    Compile the kernel     

Use the scripts provided by jetsonhacks
1. get the git
	$ cd ~/
	$ git clone http://github.com/jetsonhacks/buildJetsonTX2Kernel.git
2. Enter the repository folder
 	$ cd buildJetsonTX2Kernel
3. Get the kernel sources
	$ ./getKernelSources.sh
4. Edit the tegra18_defconfig file located in /usr/src/kernel/kernel-4.4/arch/arm64/configs/tegra18_defconfig
	Add 'CONFIG_SPI_SPIDEV=m' bellow 'CONFIG_SPI_TEGRA114=y' eg:
		CONFIG_SPI=y
 		CONFIG_SPI_TEGRA114=y
 	--> CONFIG_SPI_SPIDEV=m <--
 		CONFIG_QSPI_TEGRA186=y
5. Build the Kernel
	$ cd /usr/src/kernel/kernel-4.4
	$ sudo make tegra18_defconfig
6. Modify the file /usr/src/kernel/t18x/drivers/pinctrl/pinctrl-tegra186-padctl.c
	Remove the following lines from the tegra186_enable_vbus_oc(struct phy *phy) function
	- reg = padctl_readl(padctl, XUSB_PADCTL_VBUS_OC_MAP);
	- reg |= VBUS_ENABLE(pin);
	- padctl_writel(padctl, reg, XUSB_PADCTL_VBUS_OC_MAP);
7. Build the kernel using the jetsonhacks repository
	$ cd ~/buildJetsonTX2Kernel
	$ ./makeKernel.sh
8. Ensure the SPIDev Kernel module is copied to /lib/modules
	$ sudo cp /usr/src/kernel/kernel-4.4/drivers/spi/spidev.ko /lib/modules/$(uname -r)/kernel/drivers/
9. Update module dependencies and kernel image
	$ sudo depmod
 	$ ./copyImage.sh
10. Reboot
11. verify the SPIDev kernel
	$ cd /lib/modules/$(uname -r)
	$ cat modules.dep | grep spidev
	
-- eg. kernel/drivers/spi/spidev.ko:


### Modifying the Device Tree 

1. Install DTC Tool
	$ sudo apt update
 	$ sudo apt install device-tree-compiler
2. Decompile Device Tree
	$ cd /boot/dtb/
 	$ sudo dtc -I fs -O dts -o extracted_proc.dts /proc/device-tree
3. Ensure the following patch is present
	spi@3240000{
	    compatible = "nvidia,tegra186-spi";
	    reg = <0x0 0x3240000 0x0 0x10000>;
	    ....
	    ....
	    ....
	    linux,phandle = <0x7d>;
   -->  spi@0 {
			reg = <0x0>;
			nvidia,tx-clk-tap-delau = <0x0>;
			compatible = "spidev";
			nvidia,cs-setup-clk-count = <0x1e>;
			nvidia,cs-hold-clk-count = <0x1e>;
			spi-max-frequency = <0x1312d00>;
			nvidia,enable-hw-based-cs;
			nvidia,rx-clk-tap-delay = <0x1f>;
		}; <--
	 };
4. Remove the regulator @5
	regulator@5 {...};
3. Recompile the Device Tree
	$ cd /boot/dtb/
	$ sudo dtc -I dts -O dtb -o tegra186-quill-p3310-1000-c03-00-base.dtb extracted_proc.dts
4. enable FDT in /boot/extlinux/extlinux.conf
		LINUX /boot/Image
    --> FDT /boot/dtb/tegra186-quill-p3310-1000-c03-00-base.dtb <--
    	APPEND ${cbootargs} root=/dev/mmcblk0p1 rw rootwait rootfstype=ext4
5. Reboot
6. Verify SPIDev Device
	$ ls /dev/spi*

-- eg. /dev/spidev3.0


##	Restart usb on bootup	


1. Create the script to restart the USB on /usr/local/bin/usb_restart.sh
	$ sudo nano /usr/local/bin/usb_restart.sh
-->
	#!/bin/bash
	sleep 10
	echo "Exporting gpio"
	echo 349 > /sys/class/gpio/export
	echo "GPIO 349 exported"
	sleep 1
	echo "turning OFF USB"
	echo out > /sys/class/gpio/gpio349/direction && echo 0  > /sys/class/gpio/gpio349/value
	echo "USB OFF"
	sleep 5
	echo "turning ON USB"
	echo out > /sys/class/gpio/gpio349/direction && echo 1  > /sys/class/gpio/gpio349/value
	echo "USB ON"
	exit
<--
2. Add the right permissions 
	$ sudo chmod 744 /usr/local/bin/usb_restart.sh
3. Create the service file on /etc/systemd/system/usbRestart.service
	$ sudo nano /etc/systemd/system/usbRestart.service
-->
	[Service]
	ExecStart=/usr/local/bin/usb_restart.sh

	[Install]
	WantedBy=default.target
<--
4. Add the right permissions to the service file
	$ sudo chmod 664 /etc/systemd/system/usbRestart.service
5. Restart the service daemon
	$ sudo systemctl daemon-reload
6. Enable the new service
	$ sudo systemctl enable usbRestart.service
