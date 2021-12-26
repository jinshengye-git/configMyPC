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
sudo apt -y install curl cmake cmake-gui zsh snap vim htop terminator gimp gawk build-essential dkms ccze libboost-all-dev
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


## Install Tex (optional)
```
sudo apt -y install texlive-full
```


## Install CUDA and  cuDNN and TensorRT


```

```
then add these lines to your .bashrc or  other  bash environment config files

```
CUDA_VERSION=11.0
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

## Install zed sdk 3.5
down load zed sdk from https://www.stereolabs.com/developers/release/3.5/
choose the correct version of CUDA and your Ubuntu then
install it
wget https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/3.5/ZED_SDK_Ubuntu20_cuda11.0_v3.5.6.run

## Install OpenCV 4.1.1

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
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt -y install python3-dev python3-pip python3-venv python-dev 
sudo apt -y install libopenblas-dev libopenblas-base
sudo apt -y install libgtk-3-dev
sudo -H pip install numpy==1.19
sudo -H pip3 install numpy==1.19
sudo -H pip3 install cython
sudo -H pip install cython
sudo apt -y install libsqlite3-dev
sudo apt -y install libproj-dev
sudo apt-get install libsuitesparse-dev
cd ~
mkdir app  &&  cd app
wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.5.2.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.5.2.zip
unzip opencv.zip
unzip opencv_contrib.zip
cd opencv-4.5.2
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
