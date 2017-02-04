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
cd ../
catkin_make

cd ${MY_PATH}/gazebo_autoware_ws
source devel/setup.bash

cp -rf ./catvehicle_ws/src/catvehicle/urdf/ ${MY_PATH}/gazebo_autoware_ws/src/catvehicle/urdf/
cp -rf ./run.sh ~/gazebo_autoware_ws/
