#!/bin/bash
#
###########################################################################################
# File:         appcontainerbuild-dev.sh
# Usage:        ./appcontainerbuild-dev.sh
#
# Prerequisite: None  
#
# Description:  Build and configure the application container.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# App Container Build - Development

# Pod Configuration
app_pod="pod-app-bookmark-dev"
app_port=5001

# Create pod
podman pod create --name $app_pod -p 0.0.0.0:$app_port:$app_port

# Application
app_container="app-bookmark-dev"

# Build image
podman build --tag $app_container -f Dockerfile

# Run container
## podman run --name $app_container -dt --pod $app_pod localhost/$app_container:latest

# Get container Id
app_dev_id=$(podman image inspect --format '{{ .Id }}' $app_container)

# Tag the image
podman tag $app_container:latest $app_container:$app_container-osd-1.2

# Updload image to repository
podman login quay.io
podman tag $app_container:latest $app_container:$app_container-osd-1.2
podman push $app_container:$app_container-osd-1.2 quay.io/gresident/residentsystem:$app_container-osd-1.2