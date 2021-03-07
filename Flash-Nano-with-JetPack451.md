# Flash Jetson Nano Developer Kit (JetPack 4.5)


Trying to flash nano as Jetbot OS, 
However I tried to flash with many versions of images provided by [NVIDIA-AI-IOT/jetbot](https://github.com/NVIDIA-AI-IOT/jetbot/wiki/software-setup)

I cannot flash images properly on sd card.
The Main issue is Nano **cannot boot up, even can not see the Nvidia logo, monitor has no signal**.  (FYI, my jetson nano is the first released version.)

**[Update:]**
By following [WaveShare Wiki](https://www.waveshare.com/wiki/JetBot_AI_Kit),  Flash on SD card is working!!!!

So I tried to use [SDK Manager](https://developer.nvidia.com/nvidia-sdk-manager) ([Instructions of SDK Manager](http://docs.nvidia.com/sdk-manager/download-run-sdkm/index.html)) to flash. The Latest SDK Manager provides JetPack 4.5.1.

## Before Flash
1. Plug LAN cable, keyboard, mouse, Display cable (HDMI or DP) on Nano. 
2. Put Jumper on **Force Recover Mode (FRM)** pins.
On my Nano, the FRM pins are next to the J40 pins (You can find it near the camera Port J13).
choose the third column from the left ,put your jumper on it .
```     
o o o o < 
o o o o < J40
    ^
    put jumper on this pin column
```

and connect micro USB cable on your host PC, you will see your Nano PowerOn LED will be on.

## Flash Nano

1. Open your SDK Manager, and select the hardware type --> Jetson Nano Developer Kit ( on my case ). and SDK Manager will ask you to input USER password of host PC.

2. If you first use SDK Manager, it takes time to download and install packages on your host PC, please wait. 

3. Until you see the SDK Manager ask you to input your user name and password with the IP `192.168.55.1`  .  This is for Host PC asking the SSH login to Nano. because we did not set up yet so we need left the SDK Manager there, and go to Nano side. 

4. Now remove your Jumper from FRM ping , and put it on J48 Pins to enable DC power mode. and plugin DC (5V , 5A) adapter. Nano will auto login Ubuntu ,  you should setup user name and password there. After setup, Nano will auto reboot. 

5. login Nano set up WiFi connection, and memo Nano's IP.  Then use ssh to connect Host PC, this is the fast way to initial ssh on Nano. 

6. return to SDK Manager, input user name and password and Nano's IP (replace the `192.168.55.1` to Nano real IP) click **Install**. Now, SDK will continuously install the CUDA and other packages. Wait until finish.

## After Flash

1. setup [Desktop Share and Vino](https://qiita.com/iwatake2222/items/a3bd8d0527dec431ef0f). 
2. install zsh, oh-my-zsh, powerline fonts

### set up Display of VNC
following the instructions [here](https://devtalk.nvidia.com/default/topic/995621/jetson-tx1/jetson-tx1-desktop-sharing-resolution-problem-without-real-monitor/) Edit the /etc/X11/xorg.conf file like :

```sudo vim /etc/X11/xorg.conf```

```
# Copyright (c) 2011-2013 NVIDIA CORPORATION.  All Rights Reserved.

#
# This is the minimal configuration necessary to use the Tegra driver.
# Please refer to the xorg.conf man page for more configuration
# options provided by the X server, including display-related options
# provided by RandR 1.2 and higher.

# Disable extensions not useful on Tegra.
Section "Module"
    Disable     "dri"
    SubSection  "extmod"
        Option  "omit xfree86-dga"
    EndSubSection
EndSection

Section "Device"
    Identifier  "Tegra0"
    Driver      "nvidia"
# Allow X server to be started even if no display devices are connected.
    Option      "AllowEmptyInitialConfiguration" "true"
EndSection


Section "Monitor"
   Identifier "DSI-0"
   Option    "Ignore"
EndSection

Section "Screen"
   Identifier    "Default Screen"
   Monitor        "Configured Monitor"
   Device        "Default Device"
   SubSection "Display"
       Depth    24
       Virtual 1280 800
   EndSubSection
EndSection
```
