My personal habbit is to keep all git cloned folder in a directory named 'app'. I usually keep it under my home directory.

for example :  you can create it by ```mkdir /home/$USER/app```

this instruction is based on assuming you have this folder.


# configMyPC

things to do after install Ubuntu 20.04

## Install git
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt install git git-lfs
```

## Install useful things
```
sudo apt update
sudo apt -y install  cmake cmake-gui zsh snap vim htop terminator gimp gawk build-essential dkms ccze 
sudo apt upgrade
sudo snap install ttyplot
sudo apt autoremove
sudo reboot
```

## Install Tex (optional)
```
sudo apt -y install texlive-full
```


## Install CUDA and  cuDNN and TensorRT

```
sudo apt update
sudo apt upgrade
sudo apt -y install freeglut3 freeglut3-dev libxi-dev libxmu-dev
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo apt -y install cuda-10-2
sudo apt -y install libcudnn8 libcudnn8-dev
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

## Install zed sdk 3.2.2
down load zed sdk from https://www.stereolabs.com/developers/release/3.2/
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
git checkout 4.1.1
cd ../opencv_contrib
git checkout 4.1.1
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
