# Setup logiler_sim

## prepare .bash_ros

save the following as `/home/$USER/.bash_ros`

```
alias eb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias gs='git status'
alias gp='git pull'

catkin_folder_name='catkin_ws'
if [ -n "$BASH_VERSION" ]; then
	source /opt/ros/melodic/setup.bash  &&  source /home/s-jin/$catkin_folder_name/devel/setup.bash
	alias cw='cd ~/$catkin_folder_name'
	alias cs='cd ~/$catkin_folder_name/src'
	alias cm='cd ~/$catkin_folder_name && catkin_make'
	#echo "source bash"
elif [ -n "$ZSH_VERSION" ]; then
	source /opt/ros/melodic/setup.zsh  &&  source /home/s-jin/$catkin_folder_name/devel/setup.zsh
	alias cw='cd ~/$catkin_folder_name'
	alias cs='cd ~/$catkin_folder_name/src'
	alias cm='cd ~/$catkin_folder_name && catkin_make'
	#echo "source zsh"
fi

# export the turtlebot3
export TURTLEBOT3_MODEL=waffle_pi

# add ROS lib as well
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ros/melodic/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ros/melodic/lib/x86_64-linux-gnu

# Environment variables to work with remote workstation
export ROS_HOSTNAME=`hostname`
export ROS_MASTER_URI=http://$ROS_HOSTNAME:11311  #simulation

# Customise Logiler
export LOGILER_BATTERY=/sys/class/power_supply/BAT0
export LOGILER_TYPE=short
export LOGILER_3D_SCAN=true
#export LOGILER_OBSERVATION_SOURCES=2d_bump
export LOGILER_SIMULATION=false
export LOGILER_SERIAL_PORT=/dev/kobuki
export LOGILER_NAME=s-jin
export LOGILER_MAP_FILE=/home/$USER/.ros/map.yaml
export LOGILER_INITIAL_POSE_X=2.31522866415
export LOGILER_INITIAL_POSE_Y=1.0219815436
export LOGILER_INITIAL_POSE_A=0.3
export LOGILER_LIDAR_MIN=-1.50796447372
export LOGILER_LIDAR_MAX=1.50796447372
export LOGILER_FRONT_CAMERA=10027545 # Kobuki
export LOGILER_BACK_CAMERA=10027553
export LOGILER_BASE=keycart # logiler_sim
export LOGILER_STACKS=default # logiler_sim
export LOGILER_3D_SENSOR=zed # logiler_sim
export LOGILER_2D_SENSOR=sick
export LOGILER_ULTRASONIC_SENSOR=false
export LOGILER_OBSERVATION_SOURCES=2d_3d_bump
```

## put necessary files in .gazebo

```
cp models.tar.gz /home/$USER/.gazebo/ && cd /home/$USER/.gazebo/ 
tar -xzf models.tar.gz -C .
```

## create .rmc-sdk

```
mkdir -p .rmc-sdk && cp keycart.tar.gz /home/$USER/.rmc-sdk/ && cd /home/$USER/.rmc-sdk
tar -xzf keycart.tar.gz -C .
```



## packages necessary for the catkin_ws/src

Ros pkgs in catkin_ws/src folder:

- gazebo_ros_pkgs  `commit: b0e3d71`
- apriltag_ros `commit 92429aadc79ff8a7c2d0cbe01af644aa8ca7996f (HEAD -> master, origin/master, origin/HEAD)`
- costmap_converter
- cv_bridge
- depthimage_to_laserscan
- image_geometry
- image_transport_plugins
- kobuki_msgs
- logiler_bringup
- logiler_description
- logiler_navigation
- logiler_sim   `commit 73e5cff92d3b515258afd2664c5932b0564df2e1 (HEAD -> feature/gazebo)`
- obstacle_monitor  `commit 55530916e30b1f7fb14242586289f35567223eca (HEAD -> develop, origin/develop)`
- obstacle_msgs `commit 49e4ff9ba5796eeaf3648ed128d2ceb0a8d780a7 (HEAD -> develop, origin/develop)`
- pipeline_planner   `commit 7f9b9531c8a1a4f3673b6c1db18e045ac3cd7e0f (HEAD -> develop-orchestration, origin/develop-orchestration)`
- roboline  `commit 3f883daaead866b1edbb6ad898c564f3772baabe (HEAD -> feature/newTurn, origin/feature/newTurn)`
- robot_pose_publisher
- ros_orchestration_pkg   `branch : koba_dev`
- teb_local_planner
- ros_ultrasonic_msgs
- rqt_image_view
- rtabmap_ros
- turtlebot_teleop
- zed-ros-wrapper
- navigation `commit 0f6b9f152cb9317da526f883fc154810fc4e9af0 (HEAD -> melodic-devel, tag: 1.16.3, origin/melodic-devel, origin/HEAD)`

This is on my hostpc


Another list from David anything else is from `apt-get`


- apriltag_ros `commit 92429aadc79ff8a7c2d0cbe01af644aa8ca7996f (HEAD -> master, origin/master, origin/HEAD)`
- logiler_sim `commit 73e5cff92d3b515258afd2664c5932b0564df2e1 (HEAD -> feature/gazebo)`
- navigation `commit 0f6b9f152cb9317da526f883fc154810fc4e9af0 (HEAD -> melodic-devel, tag: 1.16.3, origin/melodic-devel, origin/HEAD)`
- obstacle_monitor `commit 55530916e30b1f7fb14242586289f35567223eca (HEAD -> develop, origin/develop)`
- obstacle_msgs `commit 49e4ff9ba5796eeaf3648ed128d2ceb0a8d780a7 (HEAD -> develop, origin/develop)`
- pipeline_planner `commit 7f9b9531c8a1a4f3673b6c1db18e045ac3cd7e0f (HEAD -> develop-orchestration, origin/develop-orchestration)`
- roboline `commit 3f883daaead866b1edbb6ad898c564f3772baabe (HEAD -> feature/newTurn, origin/feature/newTurn)`
