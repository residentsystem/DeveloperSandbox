#!/bin/bash
###########################################################################################
# File:         dataconfig-dev.sh
# Usage:        ./dataconfig-dev.sh
#
# Prerequisite: datacontainerbuild-dev.sh  
#
# Description:  Configure the database and set permissions.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################
# Database Configuration - Development

mysql --host $(hostname) --port=5507 --database=bookmark -u root -pPassword < datacreate-dev.sql