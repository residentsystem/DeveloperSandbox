#!/bin/bash
#
###########################################################################################
# File:         appcontainerremove-dev.sh
# Usage:        ./appcontainerremove-dev.sh
#
# Prerequisite: None  
#
# Description:  Remove the application container and related image.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# App Container Remove - Development

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