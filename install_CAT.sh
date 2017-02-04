#! /bin/bash
sudo apt-get install ros-indigo-controller-manager
sudo apt-get install ros-indigo-ros-control ros-indigo-ros-controllers
sudo apt-get install ros-indigo-gazebo-ros-control
sudo apt-get install ros-indigo-velodyne
sudo apt-get install ros-indigo-sicktoolbox ros-indigo-sicktoolbox-wrapper
sudo apt-get install ros-indigo-joystick-drivers
sudo apt-get install ros-indigo-novatel-span-driver

cd ~
mkdir -p catvehicle_ws/src
cd catvehicle_ws/src
catkin_init_workspace

cd ~/catvehicle_ws/src
git clone https://github.com/sprinkjm/catvehicle.git
git clone https://github.com/sprinkjm/obstaclestopper.git
cd ../
catkin_make

cd ~/catvehicle_ws
source devel/setup.bash

mv -b ./catvehicle_ws/src/catvehicle/urdf/* ~/catvehicle_ws/src/catvehicle/urdf/
mv -b ./run.sh ~/catvehicle_ws/
