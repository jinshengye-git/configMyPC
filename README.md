My personal habbit is to keep all git cloned folder in a directory named 'app'. I usually keep it under my home directory.

for example :  you can create it by ```mkdir /home/$USER/app```

this instruction is based on assuming you have this folder.


# configMyPC

things to do after install Ubuntu 18.04

# Things to prepare working environment on your PC

## Setup Nvidia Driver and Reboot PC

Activities --> Software & Updates --> Additional Drivers --> Using Nvidia driver metapackage from nvidia-driver-440 (open source/proprietary) --> Apply Changes --> reboot PC

## copy all config files (optional)

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
sudo apt -y install  cmake cmake-gui zsh snap vim htop tmux gimp gawk build-essential dkms
sudo apt upgrade
sudo snap install ttyplot
sudo apt autoremove
sudo reboot
```
## Install git
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt install git git-lfs
```
## Install Tex (optional)
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
sudo apt -y install cuda-10-2
sudo reboot
#after reboot install cuDNN and TensorRT
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt -y install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt update
sudo apt -y install libcudnn8 libcudnn8-dev
sudo apt -y install nvinfer-runtime-trt-repo-ubuntu1804-5.0.2-ga-cuda10.0
sudo apt update
sudo apt -y install -y --no-install-recommends libnvinfer-dev
sudo apt-mark hold cuda-10-2 libcudnn8 libcudnn8-dev libnvinfer7 libnvinfer-dev libnvinfer-plugin7 libnvinfer-plugin-dev cuda-repo-ubuntu1804
dpkg --get-selections|grep hold


nvidia-smi
```
then add these lines to your .bashrc or  other  bash environment config files

```
CUDA_VERSION=10.2
export PATH=/usr/local/cuda-$CUDA_VERSION/bin:${PATH}
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/cuda-$CUDA_VERSION/lib64:${LD_LIBRARY_PATH}
```

reopen your bash terminal. Check your cuda install is successed or not 

```
nvcc --version
### you will see something like:
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2018 NVIDIA Corporation
Built on Sat_Aug_25_21:08:01_CDT_2018
Cuda compilation tools, release 10.0, V10.0.130
```



## Install zed sdk 2.8.5
down load zed sdk from https://www.stereolabs.com/developers/release/2.8/
choose the correct version of CUDA and your Ubuntu then
install it

## Install OpenCV 4.1.1

```
sudo apt -y install checkinstall pkg-config yasm gfortran mlocate
sudo apt -y install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
sudo apt -y install libjpeg9-dev  libpng-dev
sudo apt -y install libtiff5-dev
sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev
sudo apt -y install  libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils
sudo apt -y install libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt -y install python3-dev python3-venv python-dev 
sudo apt -y install libopenblas-dev libopenblas-base
sudo apt -y install python3-pip libgtk-3-dev python-pip
sudo -H pip install numpy
sudo -H pip3 install numpy
sudo -H pip3 install cython
sudo -H pip install cython
sudo apt -y install libsqlite3-dev
sudo apt -y install libpcl-dev
sudo apt -y install libboost-all-dev
sudo apt -y install libproj-dev
sudo apt -y install libqt5svg5-dev
sudo apt -y install libbtf1 libcxsparse3 libgraphblas1 libklu1 libldl2 librbio2 libspqr2 
sudo apt-get install libeigen3-dev libgflags-dev libgoogle-glog-dev
sudo apt-get install libsuitesparse-dev
sudo ldconfig
zsh

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

it is better use `cmake-gui` to configure, suppose you are in folder:  opencv/build/

```
cmake-gui ..
```
Then click button: Configure 

Things you need to checkout:

- make sure python2 python3 for cv2  available...   
- make sure sfm available (sudo apt-get install libeigen3-dev libgflags-dev libgoogle-glog-dev)
- make sure CUDA IS ON
- make sure NONFREE 
- make sure MODULE path  e.g.   /home/$USER/opencv_contrib/modules
- make sure uncheck `codec` of cuda
- make sure WITH_QT  ON
- make sure WITH_OPENGL OFF
Then click "Generate" ,  after it finished, close cmake-gui and 

**NOTE for the ERROR of : Cannot Find Eigen3:**
```
in cmake-gui click "add entry"
then a in the pop up:
"name:" EIGEN_INCLUDE_PATH"
"type":PATH
"value": /usr/include/eigen3
```
Then configure and generate, that should fix it.

**NOTE: for not supporting later than gcc8:**
we change default gcc as 8.
```
sudo apt -y install gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8
```

**For the error:**
```
In file included from <command-line>:
/sources/opencv-4.1.1/build_haiku/modules/dnn/test_precomp.hpp:50:10: fatal error: test_common.hpp: No such file or directory
 #include "test_common.hpp"
          ^~~~~~~~~~~~~~~~~
compilation terminated.
```

Disable precompiled headers: `ENABLE_PRECOMPILED_HEADERS=OFF` (disabled by default on master branch)


Then make install
```
make -j8
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



## Install Sublime Text (optional)
```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

## Install zsh (optional)
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
## Install libpointmatcher
```
git clone git://github.com/ethz-asl/libnabo.git
cd libnabo
SRC_DIR=`pwd`
BUILD_DIR=${SRC_DIR}/build
mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ${SRC_DIR}
# if Eigen or Boost are not available system-wide, run at that point: 
#   cmake-gui .
# cmake-gui allows you to tell the location of Eigen or Boost
make
sudo make install


git clone https://github.com/ethz-asl/libpointmatcher.git
cd libpointmatcher
mkdir build && cd build
cmake ..
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
sudo pip3 install -y catkin_pkg
sudo apt-get install -y python3-catkin-pkg-modules
sudo apt-get install -y python3-rospkg-modules

sudo rosdep init
rosdep update
mkdir -p ~/catkin_ws/src
cd catkin_ws/src

git clone https://github.com/ros-perception/vision_opencv.git
cd vision_opencv
git checkout melodic
cd ../..

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
sudo apt -y install ros-melodic-ecl-streams ros-melodic-rqt-plot ros-melodic-yocs-cmd-vel-mux ros-melodic-map-server
sudo apt -y install ros-melodic-rviz ros-melodic-yocs-velocity-smoother ros-melodic-amcl ros-melodic-rosbridge-suite

#install robot_pose_publisher
roscd
cd ../src
git clone https://github.com/GT-RAIL/robot_pose_publisher.git
cd ..
catkin_make 
```
If you want to use python3 

```
catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3
```

## install logger

```
cd ~/app
git clone https://github.com/SeaosRobotics/logger.git
cd logger
python setup.py bdist_egg --exclude-source-files
```

## How to fix Teb_Local_Planner

How to fix teb_local_planner install on HostPC

1. install Suitesparse-dev 
```
sudo apt install libsuitesparse-dev
```
2. compile and install Official G2O

make sure your g2o is from official, and cmake g2o with proper settings.

```
sudo apt install libsuitesparse-dev
cd ~/app
git clone https://github.com/RainerKuemmerle/g2o.git 
cd g2o
mkdir build
cd build
cmake -DBUILD_WITH_MARCH_NATIVE=OFF -DG2O_BUILD_APPS=OFF -DG2O_BUILD_EXAMPLES=OFF -DG2O_USE_OPENGL=OFF ..
make -j4
sudo make install
cd ~
```

3. go to teb_local_planner folder

replace FindG2O.cmake file:  

```
cp ~/app/g2o/cmake_modules/FindG2O.cmake  ~/catkin_ws/src/teb_local_planner/cmake_modules/FindG2O.cmake
```


edit teb_local_planner/CMakeLists.txt

comment out following parts:

```
add_executable(test_optim_node src/test_optim_node.cpp)

target_link_libraries(test_optim_node
   teb_local_planner
   ${EXTERNAL_LIBS}
   ${catkin_LIBRARIES}
)


install(TARGETS test_optim_node
   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
```

and then

```
catkin_make
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
