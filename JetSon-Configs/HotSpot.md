## Setup the HotSpot (AP) on Nano

Open Network GUI

**Step 1**: on 'Wi-Fi' Tab

--> Click '+' to Add a new connection

--> Choose "WiFi" ,  give a connection name: "Wi-Fi Local AP"

--> Set SSID: NanoAP

--> Mode: Hotspot

--> Band: Auto (auto / 5G / 2.4 G)

--> Device: wlan0

**Step 2** : on 'WiFi Security' tab

--> Security: WPA & WPA2 Personal,  set password

--> if you want to set ip of hotspot, choose "IPv4 Settings" tab, Add Address, for example Address:192.168.11.1, Netmask:24 . Save.

All other device conneting to NanoAP, ip should be : 192.168.11.xxx.

Setup Done. Save and close the Window.


## To use:


On Nano Side

- select WiFi connection as 'NanoAP'

- open terminal to get Nano IP address by `ifconfig`, (wlan0 IP)

On other device:

- select WiFi connection SSID as 'NanoAP', input Password of NanoAP you set on Step 2.

Then you can login nano by ssh now.
