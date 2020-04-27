## Before setup

you need install `ros-melodic-teb-local-planner`, because rmc-sdk is not supporting the github version teb-local-planner.

```
sudo apt install ros-melodic-teb-local-planner
```


## install logger

git clone https://github.com/SeaosRobotics/logger.git

install logger  with both  **python2 and python3 version**

```
cd logger
python2 setup.py bdist_egg --exclude-source-files
python3 setup.py bdist_egg --exclude-source-files
```

## install rmc-sdk

```git clone https://github.com/SeaosRobotics/rmc-sdk.git```

following the instructions on the github to install ,  
there are two options for the install, one is python egg, one is pip, I use pip.

```
python3 -m pip install --user --retries 0 /home/s-jin/app/rmc-sdk
```

## install rmc-keycart

```git clone https://github.com/SeaosRobotics/rmc-keycart.git```

following the instructions on the github to install ,  
there are two options for the install, one is python egg, one is pip, I use pip.

```
python3 -m pip install --user --retries 0 /home/s-jin/app/rmc-keycart
```

## set yaml files

several yaml files need to be put in `~/.rmc-sdk/keycart/res/timsim`

```
mkdir -p /home/$USER/.rmc-sdk/keycart/res/timsim
cd ~/.rmc-sdk/keycart/res/timsim
wget https://github.com/jinshengye-git/configMyPC/blob/master/timsim.zip
unzip timsim.zip
rm timsim.zip
cd ~
```

## Make a soft-link of TimSim.sh

make a soft link of your TimSim.sh, depends on where you put your TimSim.sh. I am doing here is my way, you should do according to your case.

```
roscd timsim
ln -s /home/s-jin/Desktop/TimSim-0.3.0/Shipping/LinuxNoEditor/TimSim.sh TimSim.sh
```

## Check your catkin_ws/src

you should have these pkgs:

- pipeline_planner(branch: develop-orchestration)
- ros_orchestration_pkg(branch: koba_dev)
- logiler_sim(branch: develop)
- rmc-keycart(branch: develop)
- rmc-orchestration (branch: develop)  
- rmc-sdk (branch: develop)

Followings are pkgs I have as well, please set branch properly as well. Some of them might not necessary on your PC.

- rtabmap_ros
- costmap_converter           
- ddynamic_reconfigure        
- depthimage_to_laserscan     
- gazebo_ros_pkgs             
- key_cart                    
- vision_opencv
- obstacle_msgs
- roboline            
- robot_pose_publisher
- rqt_image_view
- TimSim
- turtlebot3
- turtlebot3_autorace
- turtlebot3_msgs
- zed-ros-wrapper      

then you need ```catkin_make```

## install Chrome Extension on your Browser

Go to Chrome App Web Store and Search: **Simple WebSocket Client** and install it.

## Run 

Put `Robot0.db` in `~/.ros` 

```
roslaunch logiler_sim bringup_timsim.launch mapping:=rtabmap localization:=true
```

On your RViz, try to add Pipeline to check it is launched properly:

Add -> By topic -> /move_base/PipelinePlanner/visualise_pipeline/Map


Open another terminal and run
```
WSHOST=127.0.0.1 PORT=5000 RESOURCES=/home/$USER/.rmc-sdk/keycart/res/timsim NODENAMESPACE=Robot0_ NAMESPACE=/Robot0/ ROBOTID=Robot0 python3 -m rmc_keycart -s -w
```
try to find the echo message with blue font, something like:

**[2020/4/27 13:5:53.540] [DBG] [WebsocketsKeycart::server::317]: server will start on  127.0.0.1 8765**

on your case, this **127.0.0.1 8765** might be different IP/port number.

then click the Simple WebSocket Client  button on your Chrome Browser.


in Server Location input:  

```
ws://127.0.0.1:8765/keycart
```

in Request input following command to send keycart to goal-id 1:

```
{"header": {"timestamp": 0}, "body": {"command": "start-operation", "args": [{"goal-id": 1}]}}
```

by clicking Send button your keycart should move to Goal 1. To stop the keycart:

```
{"header": {"timestamp": 0}, "body": {"command": "emergency-stop", "args": []}}
```

you can check `~/.rmc-sdk/keycart/res/timsim/path.yaml`  to confirm how many goal id you can choose.
