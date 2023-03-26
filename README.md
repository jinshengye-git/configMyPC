# configMyPC

things to do after install Ubuntu 20.04

## Install git
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt install git git-lfs
```

## Install useful things
```
sudo apt update && sudo apt upgrade && sudo apt -y install curl pv cmake cmake-gui zsh snap vim htop terminator gimp gawk build-essential dkms ccze libboost-all-dev font-manager bpytop
sudo apt autoremove
sudo apt install software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt install gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9
# for opencv 4.1.1 it is better to use gcc-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7 --slave /usr/bin/gcov gcov /usr/bin/gcov-7
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8
sudo update-alternatives --config gcc
```
## Change default terminal-emulator
`sudo update-alternatives --config x-terminal-emulator` 
input the ID number that your favourate terminal-emulator listed.

## Install Powerline fonts

```
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
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

## Install CUDA 11.5 and  cuDNN 8 and TensorRT 8

follow this [link](https://www.server-world.info/en/note?os=Ubuntu_22.04&p=nvidia&f=4)
```

```
then add these lines to your .bashrc or  other  bash environment config files

```
CUDA_VERSION=11.5
export PATH=/usr/local/cuda-$CUDA_VERSION/bin:${PATH}
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/cuda-$CUDA_VERSION/lib64:${LD_LIBRARY_PATH}
```
you would like to install ZED SDK in next because it will install [cuDNN](https://developer.nvidia.com/cudnn) and [TensorRT](https://developer.nvidia.com/tensorrt) for you.

## Install zed sdk 3.7.4
down load zed sdk from https://www.stereolabs.com/developers/release/
choose the correct version of CUDA and your Ubuntu then
install it, good news is : during the installation, zed sdk will install cuDNN8 and TensorRT8 as well.


## Install OpenCV 4.5.1
https://medium.com/@pydoni/how-to-install-cuda-11-4-cudnn-8-2-opencv-4-5-on-ubuntu-20-04-65c4aa415a7b


## Install ROS1

- sources.list `sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'`
- keys: `sudo apt install curl; curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -`
- install: `sudo apt update && sudo apt install ros-noetic-desktop-full`
- environment: zsh `echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc && source ~/.zshrc`
- dependencies: `sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential`
to set up **catkin_ws** you would like follow [here](http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment).

## Install ROS 2

build from source of [ROS2 Humble](https://docs.ros.org/en/humble/Installation/Alternatives/Ubuntu-Development-Setup.html).

```
locale  # check for UTF-8
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-flake8-blind-except \
  python3-flake8-builtins \
  python3-flake8-class-newline \
  python3-flake8-comprehensions \
  python3-flake8-deprecated \
  python3-flake8-docstrings \
  python3-flake8-import-order \
  python3-flake8-quotes \
  python3-pip \
  python3-pytest \
  python3-pytest-cov \
  python3-pytest-repeat \
  python3-pytest-rerunfailures \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget
```
it will show some error that can not locate the packages that we need manually install:

```
pip3 install flake8-blind-except
pip3 install flake8-builtins
pip3 install flake8-class-newline
pip3 install flake8-class-comprehensions
pip3 install flake8-comprehensions
pip3 install flake8-deprecated
pip3 install flake8-import-order
pip3 install flake8-import-quotes
pip3 install flake8-quotes
pip3 install pytest-repeat
pip3 install pytest-rerunfailures
pip3 install vcstool
sudo apt install python3-colcon-common-extensions
```

Then continue:

```
mkdir -p ~/ros2_humble/src
cd ~/ros2_humble
wget https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos
vcs import src < ros2.repos
sudo apt upgrade
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"
cd ~/ros2_humble/
colcon build --symlink-install
```

### Install ros1-bridge

```
cd ~/ros2_humble/src/ros2/
git clone https://github.com/ros2/ros1_bridge.git
cd ~/ros2_humble
colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure
```

Then setup the environment

put following in `~/.zshrc`.
```
export ROS1_INSTALL_PATH=/opt/ros/noetic
export ROS2_INSTALL_PATH=~/ros2_humble/install
```
#### Example 1a:
First we start a ROS 1 `roscore`:


```bash
# Shell A (ROS 1 only):
source ${ROS1_INSTALL_PATH}/setup.bash
# Or, on OSX, something like:
# . ~/ros_catkin_ws/install_isolated/setup.bash
roscore
```

---

Then we start the dynamic bridge which will watch the available ROS 1 and ROS 2 topics.
Once a *matching* topic has been detected it starts to bridge the messages on this topic.


```bash
# Shell B (ROS 1 + ROS 2):
# Source ROS 1 first:
source ${ROS1_INSTALL_PATH}/setup.bash
# Or, on OSX, something like:
# . ~/ros_catkin_ws/install_isolated/setup.bash
# Source ROS 2 next:
source ${ROS2_INSTALL_PATH}/setup.bash
# For example:
# . /opt/ros/dashing/setup.bash
export ROS_MASTER_URI=http://localhost:11311
ros2 run ros1_bridge dynamic_bridge
```

The program will start outputting the currently available topics in ROS 1 and ROS 2 in a regular interval.

---

Now we start the ROS 1 talker.


```bash
# Shell C:
source ${ROS1_INSTALL_PATH}/setup.bash
# Or, on OSX, something like:
# . ~/ros_catkin_ws/install_isolated/setup.bash
rosrun rospy_tutorials talker
```

The ROS 1 node will start printing the published messages to the console.

---

Now we start the ROS 2 listener from the `demo_nodes_cpp` ROS 2 package.


```bash
# Shell D:
source ${ROS2_INSTALL_PATH}/setup.bash
ros2 run demo_nodes_cpp listener
```

The ROS 2 node will start printing the received messages to the console.

When looking at the output in *shell B* there will be a line stating that the bridge for this topic has been created:


```bash
created 1to2 bridge for topic '/chatter' with ROS 1 type 'std_msgs/String' and ROS 2 type 'std_msgs/String'
```

At the end stop all programs with `Ctrl-C`.
Once you stop either the talker or the listener in *shell B* a line will be stating that the bridge has been torn down:


```bash
removed 1to2 bridge for topic '/chatter'
```
#### Example 1b: ROS 2 talker and ROS 1 listener

The steps are very similar to the previous example and therefore only the commands are described.


```bash
# Shell A:
source ${ROS1_INSTALL_PATH}/setup.bash
# Or, on OSX, something like:
# . ~/ros_catkin_ws/install_isolated/setup.bash
roscore
```

---


```bash
# Shell B:
source ${ROS1_INSTALL_PATH}/setup.bash
# Or, on OSX, something like:
# . ~/ros_catkin_ws/install_isolated/setup.bash
source ${ROS2_INSTALL_PATH}/setup.bash
export ROS_MASTER_URI=http://localhost:11311
ros2 run ros1_bridge dynamic_bridge
```

---

Now we start the ROS 2 talker from the `demo_nodes_py` ROS 2 package.

```bash
# Shell C:
source ${ROS2_INSTALL_PATH}/setup.bash
ros2 run demo_nodes_py talker
```

---

Now we start the ROS 1 listener.

```bash
# Shell D:
source ${ROS1_INSTALL_PATH}/setup.bash
# Or, on OSX, something like:
# . ~/ros_catkin_ws/install_isolated/setup.bash
rosrun roscpp_tutorials listener
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
