##!/bin/bash
#
## Function to create a backup of a specified directory
#backup_directory() {
#    loca1 source=$1
#    local destination=$2
#    local timestamp=$(date +"%Y%m%d_%H%M%S")
#    local backup_file="$destination/backup_${timestamp}.tar.gz"
#
#    echo "Creating backup of $source at $backup_file..."
#    
#    # Use tar to create a compressed archive of the source directory
#    tar -czf "$backup_file" -C "$source" .
#    
#    if [ $? -eq 0 ]; then
#        echo "Backup created successfully at $backup_file."
#    else
#        echo "Failed to create backup."
#fi
#
#
## Main script logic
#if [ $# -ne 2 ]; then
#    echo "Usage: $0 /home/demo/Desktop/sysadmin_toolkit /home/demo/Desktop"
#    exit 1
#fi
#
#backup_directory "$1" "$2"


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

