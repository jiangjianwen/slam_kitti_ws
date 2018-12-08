#!/bin/bash

#new terminal 1
xterm -e bash -c 'roscore' &
sleep 2

rosparam set /ndt_mapping_tku/resolution 2.0
rosparam set /ndt_mapping_tku/leaf_size 0.6
sleep1
#new terminal 4
xterm -e bash -c "cd ~/slam_kitti_ws/mypkg/catkin_ws; source devel/setup.bash; roslaunch lidar_localizer ndt_mapping_tku.launch" &
sleep 1

#new terminal 2
SEQ=01
xterm -e bash -c "cd ~/slam_kitti_ws/mypkg/catkin_ws/; source devel/setup.bash; rosrun kitti_player kitti_player -d ~/dataset/rosbag/Kitti/odometry/dataset/sequence/$SEQ --velodyne 1 --grayscale 1 --color 1 --groundtruth 1 --timestamps 1 --frequency 1 /sensor/camera/color_label/left/image_rect:=/sensor/camera/color_labels/left/image_rect /sensor/camera/grayscale/left/image_rect:=/sensor/camera/grayscale/left/image_raw /sensor/camera/grayscale/right/image_rect:=/sensor/camera/grayscale/right/image_raw"
sleep 1