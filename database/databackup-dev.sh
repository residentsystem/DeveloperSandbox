#!/bin/bash
###########################################################################################
# File:         databackup-dev.sh
# Usage:        ./databackup-dev.sh
#
# Prerequisite: datacontainerbuild-dev.sh  
#
# Description:  Backup mysql database.
#
# Author:       Eric Lacroix (Admin) lacroixe@residentsystem.com 
# Organization: Resident System
#
# Created:      2022-10-14
# Version:      1.0
###########################################################################################
# Database Configuration - Development

# Backup database
mysqldump -h $(hostname) --port=5507 -u root -pPassword bookmark > ~/database/backup/bookmark/bookmark-dev-$(date +%Y%m%d).sql --single-transaction --skip-lock-tables