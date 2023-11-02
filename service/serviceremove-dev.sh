#!/bin/bash
#
###########################################################################################
# File:         serviceremove-dev.sh
# Usage:        ./serviceremove-dev.sh
#
# Prerequisite: None  
#
# Description:  Remove systemd unit files and disable the service.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# Project Build - Development

# Application

systemctl --user stop pod-pod-app-bookmark-dev
systemctl --user disable pod-pod-app-bookmark-dev

rm -rf $HOME/.config/systemd/user/*app-bookmark-dev.service
rm -rf *app-bookmark-dev.service

# Web Server

systemctl --user stop pod-pod-web-bookmark-dev
systemctl --user disable pod-pod-web-bookmark-dev

rm -rf $HOME/.config/systemd/user/*web-bookmark-dev.service
rm -rf *web-bookmark-dev.service

# Database Server

systemctl --user stop pod-pod-data-bookmark-dev
systemctl --user disable pod-pod-data-bookmark-dev

rm -rf $HOME/.config/systemd/user/*data-bookmark-dev.service
rm -rf *data-bookmark-dev.service

# Disable user
loginctl disable-linger eric.lacroix