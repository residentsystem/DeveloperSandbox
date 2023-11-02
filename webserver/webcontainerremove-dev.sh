#!/bin/bash
#
###########################################################################################
# File:         webcontainerremove-dev.sh
# Usage:        ./webcontainerremove-dev.sh
#
# Prerequisite: None  
#
# Description:  Remove the web server container and related image.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# Container Remove - Development

# Pod
web_pod="pod-web-bookmark-dev"

# Web Server
web_container="web-bookmark-dev"

# Remove web server container and image
podman stop $web_container
podman rm $web_container
podman image rm $web_container

# Remove pod container
podman pod stop $web_pod
podman pod rm $web_pod