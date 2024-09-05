#!/bin/bash
# Description: Backup script

backup_directory() {
    local src=$1
    local dest=$2
    local timestamp=$(date +%Y%m%d%H%M%S)
    local backup_name=$(basename "$src")_$timestamp.tar.gz

    # Create the backup
    tar -czf "$dest/$backup_name" "$src"
    
    # Check if tar was successful
    if [[ $? -eq 0 ]]; then
        echo "Backup of $src completed successfully at $dest/$backup_name"
    else
        echo "Backup failed."
        exit 1
    fi
}

# Call the function
backup_directory "/home/demo/Desktop/Gemini_sysadmin_bscript" "/home/demo/Desktop/"
