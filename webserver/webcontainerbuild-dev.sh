#!/bin/bash
#
###########################################################################################
# File:         webcontainerbuild-dev.sh
# Usage:        ./webcontainerbuild-dev.sh
#
# Prerequisite: None  
#
# Description:  Build and configure the web server container.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# Web Container Build - Development

# Pod Configuration
web_pod="pod-web-bookmark-dev"
http_port=5081
https_port=5444

# Create pod
podman pod create --name $web_pod -p 0.0.0.0:$http_port:$http_port -p 0.0.0.0:$https_port:$https_port

# Web Server
web_container="web-bookmark-dev"

# Build image
podman build --tag $web_container -f Dockerfile

# Run container
podman run --name $web_container -dt --pod $web_pod localhost/$web_container:latest

# Get container Id
web_dev_id=$(podman image inspect --format '{{ .Id }}' $web_container)

# Updload image to repository
podman login quay.io
podman tag $web_container:latest $web_container:$web_container-osd-1.2
podman push $web_container:$web_container-osd-1.2 quay.io/gresident/residentsystem:$web_container-osd-1.2