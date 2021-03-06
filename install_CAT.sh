#! /bin/bash
sudo apt-get install ros-indigo-controller-manager
sudo apt-get install ros-indigo-ros-control ros-indigo-ros-controllers
sudo apt-get install ros-indigo-gazebo-ros-control
sudo apt-get install ros-indigo-velodyne
sudo apt-get install ros-indigo-sicktoolbox ros-indigo-sicktoolbox-wrapper
sudo apt-get install ros-indigo-joystick-drivers
sudo apt-get install ros-indigo-novatel-span-driver

MY_PATH=$(readlink -f  $(dirname $0))

cd ~
mkdir -p ${MY_PATH}/gazebo_autoware_ws/src
cd ${MY_PATH}/gazebo_autoware_ws/src
catkin_init_workspace

cd ${MY_PATH}/gazebo_autoware_ws/src
git clone https://github.com/sprinkjm/catvehicle.git
git clone https://github.com/sprinkjm/obstaclestopper.git
cp -rf ${MY_PATH}/catvehicle_ws/src/point_cloud_converter ${MY_PATH}/gazebo_autoware_ws/src/
cd ../
catkin_make

cd ${MY_PATH}/gazebo_autoware_ws
source devel/setup.bash

cd ${MY_PATH}
cp -rf ./catvehicle_ws/src/catvehicle/urdf/* ./gazebo_autoware_ws/src/catvehicle/urdf/
cp -rf ./catvehicle_ws/src/catvehicle/launch/catvehicle.launch ./gazebo_autoware_ws/src/catvehicle/launch/
cp -rf ./run.sh ./gazebo_autoware_ws/
