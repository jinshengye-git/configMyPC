My personal habbit is to keep all git cloned folder in a directory named 'app'. I usually keep it under my home directory.

for example :  you can create it by ```mkdir /home/$USER/app```

this instruction is based on assuming you have this folder.


# configMyPC

things to do after install Ubuntu 18.04

# Things to prepare working environment on your PC

## Setup Nvidia Driver and Reboot PC

Activities --> Software & Updates --> Additional Drivers --> Using Nvidia driver metapackage from nvidia-driver-440 (open source/proprietary) --> Apply Changes --> reboot PC

## Install git
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt install git git-lfs
```

## Install useful things
```
sudo apt update
sudo apt upgrade
sudo apt -y install  cmake cmake-gui zsh snap vim htop terminator gimp gawk build-essential dkms ccze
sudo snap install ttyplot
sudo apt autoremove
```

## Install Tex (optional)
```
sudo apt -y install texlive-full
```

## Install CUDA and  cuDNN and TensorRT

```
sudo wget -O /etc/apt/preferences.d/cuda-repository-pin-600 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt -y install cuda-11-0

export CUDA_PATH=/usr/local/cuda-11.0
echo 'export CUDA_PATH=/usr/local/cuda-11.0' >> ${HOME}/.bashrc
echo 'export CUDA_PATH=/usr/local/cuda-11.0' >> ${HOME}/.zshrc
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:${LD_LIBRARY_PATH}
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:${LD_LIBRARY_PATH}' >> ${HOME}/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:${LD_LIBRARY_PATH}' >> ${HOME}/.zshrc
export PATH=/usr/local/cuda-11.0/bin:${PATH}
echo 'export PATH=/usr/local/cuda-11.0/bin:${PATH}' >> ${HOME}/.bashrc
echo 'export PATH=/usr/local/cuda-11.0/bin:${PATH}' >> ${HOME}/.zshrc

dpkg -l | grep cuda
sudo apt-mark hold cuda-11-0                   
sudo apt-mark hold cuda-command-line-tools-11-0
sudo apt-mark hold cuda-compiler-11-0          
sudo apt-mark hold cuda-cudart-11-0            
sudo apt-mark hold cuda-cudart-dev-11-0        
sudo apt-mark hold cuda-cuobjdump-11-0         
sudo apt-mark hold cuda-cupti-11-0             
sudo apt-mark hold cuda-cupti-dev-11-0         
sudo apt-mark hold cuda-demo-suite-11-0        
sudo apt-mark hold cuda-documentation-11-0     
sudo apt-mark hold cuda-driver-dev-11-0        
sudo apt-mark hold cuda-drivers                
sudo apt-mark hold cuda-drivers-470            
sudo apt-mark hold cuda-gdb-11-0               
sudo apt-mark hold cuda-libraries-11-0         
sudo apt-mark hold cuda-libraries-dev-11-0     
sudo apt-mark hold cuda-memcheck-11-0          
sudo apt-mark hold cuda-nsight-11-0            
sudo apt-mark hold cuda-nsight-compute-11-0    
sudo apt-mark hold cuda-nsight-systems-11-0    
sudo apt-mark hold cuda-nvcc-11-0              
sudo apt-mark hold cuda-nvdisasm-11-0          
sudo apt-mark hold cuda-nvml-dev-11-0          
sudo apt-mark hold cuda-nvprof-11-0            
sudo apt-mark hold cuda-nvprune-11-0           
sudo apt-mark hold cuda-nvrtc-11-0             
sudo apt-mark hold cuda-nvrtc-dev-11-0         
sudo apt-mark hold cuda-nvtx-11-0              
sudo apt-mark hold cuda-nvvp-11-0              
sudo apt-mark hold cuda-runtime-11-0           
sudo apt-mark hold cuda-samples-11-0           
sudo apt-mark hold cuda-sanitizer-11-0         
sudo apt-mark hold cuda-toolkit-11-0           
sudo apt-mark hold cuda-tools-11-0             
sudo apt-mark hold cuda-visual-tools-11-0      
sudo apt-mark hold libcudnn8                   
sudo apt-mark hold libcudnn8-dev               

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
sudo -H pip install numpy==1.19
sudo -H pip3 install numpy==1.19
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

it is better use `cmake-gui` to configure, suppose you are in folder:  opencv/build/

```
cmake-gui ..
```
Then click button: Configure 

Things you need to checkout:

- make sure python2 python3 for cv2  available...   
- make sure sfm available
- make sure CUDA IS ON
- make sure NONFREE 
- make sure MODULE path  e.g.   /home/$USER/opencv_contrib/modules
- make sure uncheck `codec` of cuda
- make sure WITH_QT  ON
- make sure WITH_OPENGL OFF
Then click "Generate" ,  after it finished, close cmake-gui and 

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
