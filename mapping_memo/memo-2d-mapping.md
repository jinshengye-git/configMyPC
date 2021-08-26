
# 2D Mapping for Wide Area 

Logiler_bringup should be **develop** branch.
Kobuki moving on default speed 0.2,   better with 0.4.



## Recording a bag



```
roslaunch logiler_bringup record.launch

roslaunch logiler_bringup bag.launch mapping:=2d

roslaunch turtlebot_teleop keyboard_teleop.launch

```

**NOTE**: then most important part is To change the laser scan resolution on rqt_reconfigure

```
rosrun rqt_reconfigure rqt_reconfigure
```

to set the resolution of the scan to `0.006989`



## Making map from bag

```
rosparam set use_sim_time true; rosbag play --pause --clock 2020-12-01-12-49-56.bag
roslaunch logiler_bringup data_recorder_2d.launch
```


## Directly Mapping

```
roslaunch logiler_bringup map_karto.launch
roslaunch logiler_bringup bag.launch mapping:=2d
roslaunch turtlebot_teleop keyboard_teleop.launch

```

**NOTE**: then most important part is To change the laser scan resolution on rqt_reconfigure

```
rosrun rqt_reconfigure rqt_reconfigure
```

to set the resolution of the scan to `0.006989`

Kobuki speed : 0.2--0.4

**NOTE2**:
Kobuki moving with wobbling is the main reason of why 2-D map cannot be closed.
