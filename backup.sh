#!/bin/bash
# Description: Backup script

backup_directory() {
    local src=$1
    local dest=$2
    local timestamp=$(date +%Y%m%d%H%M%S)
    local backup_name=$(basename $src)_$timestamp.tar.gz

    tar -czf $dest/$backup_name $src
    echo "Backup of $src completed at $dest/$backup_name"
}

# Call the function
backup_directory "/home/demo/Desktop/sysadmin_toolkit" "/home/demo/Desktop/"

#./backup.sh /var/www /backups   # Backup /var/www directory to /backups directory

