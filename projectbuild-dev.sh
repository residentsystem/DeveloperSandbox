#!/bin/bash
#
###########################################################################################
# File:         projectbuild-dev.sh
# Usage:        ./projectbuild-dev.sh
#
# Prerequisite: None  
#
# Description:  Build and configure all containers for this project.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# Project Build - Development

# Application

# Pod Configuration
app_pod="pod-app-bookmark-dev"
app_port=5001

# Create pod
podman pod create --name $app_pod -p 0.0.0.0:$app_port:$app_port

# Application
app_container="app-bookmark-dev"

# Build image
podman build --tag $app_container -f ./application/Dockerfile

# Run container
podman run --name $app_container -dt --pod $app_pod localhost/$app_container:latest

# Web Server

# Pod Configuration
web_pod="pod-web-bookmark-dev"
http_port=5081
https_port=5444

# Create pod
podman pod create --name $web_pod -p 0.0.0.0:$http_port:$http_port -p 0.0.0.0:$https_port:$https_port

# Web Server
web_container="web-bookmark-dev"

# Build image
podman build --tag $web_container -f ./webserver/Dockerfile

# Run container
podman run --name $web_container -dt --pod $web_pod localhost/$web_container:latest

# Database Server

# Pod Configuration
data_pod="pod-data-bookmark-dev"
data_port=5507

# Create pod
podman pod create --name $data_pod -p 0.0.0.0:$data_port:$data_port

# Database Server
data_container="data-bookmark-dev"
data_volume="data-bookmark-dev"

# Create volume and set permissions
podman unshare mkdir ~/volumes/$data_volume
podman unshare chown 27:27 -R ~/volumes/$data_volume
podman unshare chmod 750 ~/volumes/$data_volume

# Build image
podman build --tag $data_container -f ./database/Dockerfile

# Run container
podman run --name $data_container -dt --pod $data_pod -v ~/volumes/$data_volume:/var/lib/mysql:z localhost/$data_container:latest