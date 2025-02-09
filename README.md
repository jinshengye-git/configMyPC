# configMyPC

## Install Arch Linux

[Get iso from HERE](https://mirror.aria-on-the-planet.es/archlinux/iso/)

launch Arch Linux from USB

```
iwctl
device list # most cases the wifi device is named wlan0.
station wlan0 scan 
station wlan0 get-networks
station wlan0 connect "SSID"  # it will ask you to input wifi password to connect.
exit
```

test wifi connection:

```
ping google.com
```

after confirmed network we can start to install the OS:

```
archinstall
```

all steps are similar with Ubuntu.

except the network config, you should use **Manual config after install os.** 

and the Profile should be "Desktop" and then choose the desktop distro.

## Post install.

### install docker

1. Docker

```
sudo pacman -S docker docker-compose 
```

2. Nvidia container toolkit

```
yay -S nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

### Brave-browser

```
curl -fsS https://dl.brave.com/install.sh | sh
```

## BLUETOOTH CONFIGURATION FOR ARCH LINUX

### INSTALLATION

- Install the ***bluez package***, providing the Bluetooth protocol stack.
- Install the ***bluez-utils package***, providing the bluetoothctl utility.
 Alternatively install ***bluez-utils-compat*** (with AUR) to additionally have the deprecated BlueZ tools.
- The generic Bluetooth driver is the btusb kernel module. Check whether that module is loaded. If it is not, then load the module.
- Start/enable bluetooth.service.

#### INSTALL PACKAGES
``` sh
	$ sudo pacman -S bluez bluez-utils
```


To see if the bluetooth module is present

``` sh
	$ lsmod | grep btusb
```
#### CONFIGURATION


``` sh
	$ sudo systemctl start bluetooth.service
```

``` sh
	$ sudo systemctl enable bluetooth.service
```

#### START BLUETOOTHCTL
Launch the command of the bluetooth

``` sh
	$ bluetoothctl
```
#### Power on bluetooth
``` sh
	[bluetooth]$ power on
```
#### Set the agent

``` sh
	[bluetooth]$ agent on
```

``` sh
	[bluetooth]$ default-agent
```
#### SCAN DEVICES

``` sh
	[bluetooth]$ scan on
```

find and select the MAC ADDRESS of the devices you want to connect
#### TRUST
With this line we can remember the device even if is not connected
``` sh
	[bluetooth]$ trust <Mac Address>
```

#### PAIR

``` sh
	[bluetooth]$ pair <Mac Address>
```

#### CONNECT

``` sh
	[bluetooth]$ connect <Mac Address>
```

#### CLOSE SCAN AND EXIT
At the end power off the scan and exit

``` sh
	[bluetooth]$ scan off
```
``` sh
	[bluetooth]$ exit
```

## ON STARTUP
To Start it automatically at startup
``` sh
 	$ sudo vim /etc/bluetooth/main.conf
```

if is not working try use

``` sh
	$ sudo vi /etc/bluetooth/main.conf
```

And change the comment 
```
	AutoEnable=true
```


## Install oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## p10k (optional for oh-my-zsh)
**Use font-manager to install tty fonts in batch.**
Download these four ttf files:
   - [MesloLGS NF Regular.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
   - [MesloLGS NF Bold.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
   - [MesloLGS NF Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
   - [MesloLGS NF Bold Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

   - [Nerd-Fonts Releases](https://github.com/ryanoasis/nerd-fonts/releases)

### NerdFont Setup
1.) Download a [Nerd Font](https://www.nerdfonts.com/font-downloads)

2.) Unzip and copy to `~/.fonts`

3.) Run the command `fc-cache -fv` to manually rebuild the font cache

```
cd ~/.oh-my-zsh/custom/themes
git clone https://github.com/romkatv/powerlevel10k.git
```
Change the theme in `~/.zshrc`
`ZSH_THEME="powerlevel10k/powerlevel10k"`
Then restart **zsh**.

## Git Gpg key
```
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long  # you will get 'sec   rsa4096/xxxxxxxxxxx 0000-00-00 [SC]'
gpg --armor --export xxxxxxxxxxx
git config --global user.signingkey xxxxxxxxxxx
git config --global commit.gpgsign true
```








## VSCode Font

Install Font first.
Download these four ttf files:
   - [MesloLGS NF Regular.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
   - [MesloLGS NF Bold.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
   - [MesloLGS NF Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
   - [MesloLGS NF Bold Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

save the following in  `~/.config/Code/User/settings.json`

```
{
    "workbench.iconTheme": "vscode-icons",
    "workbench.colorTheme": "One Dark Pro",
    "workbench.preferredDarkColorTheme": "Atom One Dark",
    "terminal.integrated.fontFamily": "MesloLGS NF",
    "editor.fontWeight": "400",
    "editor.fontSize": 15,
    "C_Cpp.updateChannel": "Insiders",
    "debug.onTaskErrors": "showErrors",
    "vsicons.dontShowNewVersionMessage": true,
    "python.jediEnabled": false,
    "terminal.integrated.inheritEnv": false,
    "terminal.external.linuxExec": "Tilix",
    "terminal.integrated.fontSize": 20,
    "kite.showWelcomeNotificationOnStartup": false,
    "cmake.configureOnOpen": false,
    "oneDarkPro.bold": true,
    "python.languageServer": "Pylance",
    "explorer.confirmDelete": false,
    "workbench.editorAssociations": {
        "*.ipynb": "jupyter-notebook"
    },
    "python.showStartPage": false,
    "diffEditor.maxComputationTime": 9999,
    "explorer.confirmDragAndDrop": false,
    "terminal.integrated.tabs.enabled": true,
    "terminal.integrated.defaultProfile.linux": "/bin/zsh (migrated)",
    "terminal.integrated.profiles.linux": {
        "/bin/zsh (migrated)": {
            "path": "/bin/zsh",
            "args": []
        }
    },
    "workbench.colorCustomizations": {
        "editorRuler.foreground": "#00e1ff"
    },
    "notebook.cellToolbarLocation": {
        "default": "right",
        "jupyter-notebook": "left"
    },
    "git.autofetch": true,
    "editor.rulers": [
    80,120
    ],
    "editor.wordWrap": "on",
    "redhat.telemetry.enabled": true,
    "cSpell.userWords": [
        "asensor",
        "checkopencm",
        "cmds",
        "coef",
        "DGRAM",
        "INET",
        "ioboard",
        "mlogger",
        "Mlogging",
        "mymath",
        "nsecs",
        "opencm",
        "pyee",
        "rbline",
        "Recieving",
        "recvfrom",
        "reliab",
        "roboline",
        "roscore",
        "rosgraph",
        "rospy",
        "rostopic",
        "sendto",
        "serialutil",
        "Shengye",
        "sona",
        "velodyne"
    ],
    "editor.fontFamily": "'MesloLGS NF', 'MeloLGS Regular', monospace",
    "editor.fontLigatures": false
}
```
