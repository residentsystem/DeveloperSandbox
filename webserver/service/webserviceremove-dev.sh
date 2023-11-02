#!/bin/bash
#
###########################################################################################
# File:         webserviceremove-dev.sh
# Usage:        ./webserviceremove-dev.sh
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

systemctl --user stop pod-pod-web-bookmark-dev
systemctl --user disable pod-pod-web-bookmark-dev

rm -rf $HOME/.config/systemd/user/*web-bookmark-dev.service
rm -rf *bookmark-dev.service

loginctl disable-linger eric.lacroix