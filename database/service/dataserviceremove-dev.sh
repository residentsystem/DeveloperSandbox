#!/bin/bash
#
###########################################################################################
# File:         dataserviceremove-dev.sh
# Usage:        ./dataserviceremove-dev.sh
#
# Prerequisite: None  
#
# Description:  Remove systemd unit files and disable the service.
#               
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-11-03
# Version:      1.0
###########################################################################################

# Service Remove - Development

# Remove noexec from home folder if getting permission denied.
## mount -o remount,exec /home

systemctl --user stop pod-pod-data-bookmark-dev
systemctl --user disable pod-pod-data-bookmark-dev

rm -rf $HOME/.config/systemd/user/*data-bookmark-dev.service
rm -rf *bookmark-dev.service

loginctl disable-linger eric.lacroix