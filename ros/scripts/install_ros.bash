#!/usr/bin/env bash

# http://wiki.ros.org/noetic/Installation/Ubuntu

ROS_DISTRO="noetic"

sudo -l

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update
sudo apt install -y --no-install-recommends \
    ros-$ROS_DISTRO-desktop-full

echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> $HOME/.bashrc
exec bash

sudo apt install -y --no-install-recommends \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    python3-catkin-tools \
    build-essential

sudo rosdep init
rosdep update
