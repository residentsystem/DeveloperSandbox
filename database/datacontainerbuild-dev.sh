#!/bin/bash
#
###########################################################################################
# File:         datacontainerbuild-dev.sh
# Usage:        ./datacontainerbuild-dev.sh
#
# Prerequisite: None  
#
# Description:  Build and configure the database server container.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################

# Database Container Build - Development

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
podman build --tag $data_container -f Dockerfile

# Run container
## podman run --name $data_container -dt --pod $data_pod -v ~/volumes/$data_volume:/var/lib/mysql:z localhost/$data_container:latest

# Get container Id
data_dev_id=$(podman image inspect --format '{{ .Id }}' $data_container)

# Tag the image
podman tag $data_container:latest $data_container:$data_container-osd-1.2

# Updload image to repository
podman login quay.io
podman tag $data_container:latest $data_container:$data_container-osd-1.2
podman push $data_container:$data_container-osd-1.2 quay.io/gresident/residentsystem:$data_container-osd-1.2