#!/bin/bash
#
###########################################################################################
# File:         datacontainerremove-dev.sh
# Usage:        ./datacontainerremove-dev.sh
#
# Prerequisite: None  
#
# Description:  Remove the database server container and related image.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# Database Container Remove - Development

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