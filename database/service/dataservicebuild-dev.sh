#!/bin/bash
#
###########################################################################################
# File:         dataservicebuild-dev.sh
# Usage:        ./dataservicebuild-dev.sh
#
# Prerequisite: None  
#
# Description:  Create systemd unit files to be used to control a rootless container or pod.
#               
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-11-03
# Version:      1.0
###########################################################################################

# Service Build - Development

# Remove noexec from home folder if getting permission denied.
## mount -o remount,exec /home

podman generate systemd --files --name pod-data-bookmark-dev

mkdir $HOME/.config/systemd
mkdir $HOME/.config/systemd/user

cp ./*.service $HOME/.config/systemd/user

# Enable the service to run as a non-root user. Allow the service to keep running
# while the user is logged off. 
systemctl --user enable pod-pod-data-bookmark-dev
loginctl enable-linger eric.lacroix

# Start and Stop the service (pod)
systemctl --user start pod-pod-data-bookmark-dev