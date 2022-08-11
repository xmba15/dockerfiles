#!/usr/bin/env bash

# http://docs.ros.org/en/galactic/Installation/Ubuntu-Install-Debians.html

ROS_DISTRO="galactic"

sudo apt update
sudo apt install -y --no-install-recommends \
    locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt install -y --no-install-recommends \
    curl \
    gnupg \
    lsb-release

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt upgrade

sudo apt install -y --no-install-recommends \
    ros-$ROS_DISTRO-desktop

echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> $HOME/.bashrc
exec bash

sudo apt install -y --no-install-recommends \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-argcomplete \
    build-essential

sudo rosdep init
rosdep update
