#!/bin/bash
#
###########################################################################################
# File:         projectremove-dev.sh
# Usage:        ./projectremove-dev.sh
#
# Prerequisite: None  
#
# Description:  Remove all containers for this project.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# Project Build - Development

# Application

# Pod
app_pod="pod-app-bookmark-dev"

# Application
app_container="app-bookmark-dev"

# Remove application container and image
podman stop $app_container
podman rm $app_container
podman image rm $app_container

# Remove pod container
podman pod stop $app_pod
podman pod rm $app_pod

# Web Server

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

# Database Server

# Pod
data_pod="pod-data-bookmark-dev"

# Database Server
data_container="data-bookmark-dev"
data_volume="data-bookmark-dev"

# Remove database container and image
podman stop $data_container
podman rm $data_container
podman image rm $data_container

podman unshare rm -rf ~/volumes/$data_volume

# Remove pod container
podman pod stop $data_pod
podman pod rm $data_pod