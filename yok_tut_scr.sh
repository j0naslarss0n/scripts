#! /bin/bash
#
# A script to print requirements and versions and to install needed 
# dependencies and packages and to install needed packages for setting up
# a Yocto-tutorial project, found here:
# https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
# 
# Jonas Larsson 2023
#

echo ":::::::::    Git version 1.8.3.1 or above?   :::::::::::::::::::::::::::"
echo "installed version: "
git --version
echo "------------------------------------------------------------------------"
echo ":::::::::     Tar version 1.28  or above?   ::::::::::::::::::::::::::::"
echo "installed version: "
tar --version
echo "------------------------------------------------------------------------"
echo ":::::::::     Python3 version 3.6.9 or above?   : ::::::::::::::::::::::"
echo "Installed version: "
python3 --version
echo "------------------------------------------------------------------------"
echo ":::::::::     GCC version  7.5 or above ?  :::::::::::::::::::::::::::::"
echo "Installed: "
gcc --version
echo "------------------------------------------------------------------------"
echo ":::::::::     GNUmake version 4.0 or above ?  ::::::::::::::::::::::::::"
echo "Installed version: "
make --version
echo "------------------------------------------------------------------------"
read -p "Are dependencies met (y/n)?" met


if [[ ${met^} == "Y" ]]; then
    echo "Continue to install needed packages (Admin privileges needed)"

    sleep 2
    
    sudo apt-get install gawk wget git diffstat unzip texinfo gcc build-essential chrpath\
    socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git\
    python3-jinja2 libegl1-mesa libsdl1.2-dev pylint xterm python3-subunit mesa-common-dev zstd liblz4-tool

elif [[ ${met^} == "N" ]]; then
    
    read -p "Would you like to install the dependencies (y/n)?" dep
fi
    if [[ ${dep^} == "Y" ]]; then
	
	sudo apt-get update && sudo apt-get install git tar python3 gcc make
    else
	echo "Aborting"
fi
