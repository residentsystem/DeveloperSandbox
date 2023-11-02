#!/bin/bash
#
###########################################################################################
# File:         appserviceremove-dev.sh
# Usage:        ./appserviceremove-dev.sh
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

systemctl --user stop pod-pod-app-bookmark-dev
systemctl --user disable pod-pod-app-bookmark-dev

rm -rf $HOME/.config/systemd/user/*app-bookmark-dev.service
rm -rf *bookmark-dev.service

loginctl disable-linger eric.lacroix