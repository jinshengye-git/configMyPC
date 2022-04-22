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
sudo apt -y install curl pv cmake cmake-gui zsh snap vim htop terminator gimp gawk build-essential dkms ccze libboost-all-dev
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


## Install CUDA 11.5 and  cuDNN 8 and TensorRT 8

follow this [link](https://qiita.com/cinchan/items/9718e1f26146dc5e3eaa)
```

```
then add these lines to your .bashrc or  other  bash environment config files

```
CUDA_VERSION=11.5
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

## Install zed sdk 
down load zed sdk from https://www.stereolabs.com/developers/release/
choose the correct version of CUDA and your Ubuntu then
install it


## Install OpenCV 4.5.1
https://medium.com/@pydoni/how-to-install-cuda-11-4-cudnn-8-2-opencv-4-5-on-ubuntu-20-04-65c4aa415a7b
