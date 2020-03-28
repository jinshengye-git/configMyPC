# configMyPC
things to do after install Ubuntu 18.04

# Things to prepare working environment on your PC

## First change Nvidia Driver and Reboot PC
Just do it .

## copy all config files

go to path you save the files

```
cp .st-ke* ~/
cp .hostpc ~/
cp .source* ~/
cp .zshrc ~/
cp .ros_sim ~/
cp .rosrc ~/
```

## Install useful things
```
sudo apt update
sudo apt -y install git git-lfs cmake cmake-gui zsh snap vim htop tmux gimp gawk build-essential dkms
sudo apt upgrade
sudo snap install ttyplot
sudo apt autoremove
sudo reboot
```
## Install Tex
```
sudo apt -y install texlive-full
```


## Install CUDA and  cuDNN and TensorRT

```
sudo apt -y install freeglut3 freeglut3-dev libxi-dev libxmu-dev
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo apt update
sudo apt upgrade
sudo apt -y install cuda-10-0
sudo reboot
#after reboot install cuDNN and TensorRT
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt -y install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt update
sudo apt -y install libcudnn7 libcudnn7-dev
sudo apt -y install nvinfer-runtime-trt-repo-ubuntu1804-5.0.2-ga-cuda10.0
sudo apt update
sudo apt -y install -y --no-install-recommends libnvinfer-dev
nvidia-smi
```
## Install zed sdk
down load zed sdk from https://www.stereolabs.com/developers/release/2.8/
install it

## Install OpenCV 3.4.6

```
sudo apt -y remove x264 libx264-dev
sudo apt autoremove
sudo apt -y install checkinstall pkg-config yasm gfortran
sudo apt -y install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
sudo apt -y install libjpeg8-dev libjasper-dev libpng12-dev
sudo apt -y install libtiff5-dev
sudo apt -y install libtiff-dev
sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt -y install python3-dev python3-pip python3-venv python-dev python-pip
sudo apt -y install libopenblas-dev libopenblas-base
sudo apt -y install libgtk-3-dev
sudo -H pip install numpy
sudo -H pip3 install numpy
sudo -H pip3 install cython
sudo -H pip install cython
sudo apt -y install libsqlite3-dev
sudo apt -y install libpcl-dev
sudo apt -y install libboost-all-dev
sudo apt -y install libproj-dev
sudo apt -y install libqt5svg5-dev
sudo apt -y install libvtk6-qt-dev

cd ~
mkdir app  &&  cd app
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
cd opencv
git checkout 3.4.6
cd ../opencv_contrib
git checkout 3.4.6
cd ../opencv
mkdir build
cd build
```

it is better use `cmake-gui` to configure,  

- make sure python2 python3 for cv2  available...   
- make sure sfm available
- make sure CUDA
- make sure NONFREE 
- make sure MODULE path
- make sure uncheck `codec` of cuda

Then 

```
make -j8
sudo make install
```

## install g2o
```
git clone https://github.com/SeaosRobotics/g2o.git 
cd g2o
mkdir build
cd build
cmake -DBUILD_WITH_MARCH_NATIVE=OFF -DG2O_BUILD_APPS=OFF -DG2O_BUILD_EXAMPLES=OFF -DG2O_USE_OPENGL=OFF ..
make -j4
sudo make install
```

## install GTSAM

```
git clone --branch 4.0.0-alpha2 https://github.com/borglab/gtsam.git gtsam-4.0.0-alpha2
cd gtsam-4.0.0-alpha2
mkdir build
cd build
cmake -DGTSAM_USE_SYSTEM_EIGEN=ON -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF -DGTSAM_BUILD_TESTS=OFF -DGTSAM_BUILD_UNSTABLE=OFF ..
make -j4
sudo make install
```

## install cvsba

cvsba: Follow installation instructions from [here](http://www.uco.es/investiga/grupos/ava/node/39). 
Their installation is not standard CMake, you need these extra steps so RTAB-Map can find it: 

```
sudo mkdir /usr/local/lib/cmake/cvsba 
sudo mv /usr/local/lib/cmake/Findcvsba.cmake /usr/local/lib/cmake/cvsba/cvsbaConfig.cmake
```

## install RtabMap

```
git clone https://github.com/SeaosRobotics/rtabmap.git
cd rtabmap
mkdir build
cd build
cmake ..

# make sure your CSPARSE_INCLUDE_DIR is set to /home/s-jin/app/g2o/EXTERNAL/csparse

make -j8
sudo make install
```


## Install Sublime Text
```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

## Install zsh
```
sudo apt -y install curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd app

# install fonts of powerline
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

```
## Install apriltags

```
cd ~/app
git clone https://github.com/SeaosRobotics/apriltag.git
cd apriltag
cmake .
make
sudo make install
```



## Install ROS

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt -y install ros-melodic-ros-base
sudo apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt -y install python-rosdep libbtf1 libcxsparse3 libgraphblas1 libklu1 libldl2 librbio2 libspqr2 libsuitesparse-dev 
sudo rosdep init
rosdep update
mkdir -p ~/catkin_ws/src
cd catkin_ws
catkin_make
sudo apt -y install pyqt5-dev-tools
sudo apt -y install ros-melodic-urdf ros-melodic-roslint ros-melodic-robot-pose-ekf ros-melodic-image-transport 
sudo apt -y install ros-melodic-velodyne-pointcloud ros-melodic-costmap-2d ros-melodic-rqt-gui ros-melodic-rqt-gui-cpp 
sudo apt -y install ros-melodic-joy ros-melodic-xacro ros-melodic-controller-manager ros-melodic-transmission-interface
sudo apt -y install ros-melodic-joint-limits-interface ros-melodic-global-planner ros-melodic-gmapping 
sudo apt -y install ros-melodic-robot-state-publisher ros-melodic-kobuki-driver
sudo apt -y install ros-melodic-nav-core ros-melodic-navfn ros-melodic-move-base-msgs ros-melodic-tf-conversions
sudo apt -y install ros-melodic-eigen-conversions ros-melodic-tf2-geometry-msgs ros-melodic-base-local-planner 
sudo apt -y install ros-melodic-interactive-markers ros-melodic-rqt-robot-dashboard ros-melodic-gazebo-dev 
sudo apt -y install ros-melodic-ecl-exceptions ros-melodic-ecl-threads ros-melodic-kobuki-msgs ros-melodic-yocs-controllers
sudo apt -y install ros-melodic-ecl-geometry ros-melodic-kobuki-dock-drive ros-melodic-polled-camera 
sudo apt -y install ros-melodic-camera-info-manager ros-melodic-control-toolbox ros-melodic-move-base
sudo apt -y install ros-melodic-ecl-streams ros-melodic-rqt-plot 
```

## install logger

```
cd ~/app
git clone https://github.com/SeaosRobotics/logger.git
cd logger
python setup.py bdist_egg --exclude-source-files
```

