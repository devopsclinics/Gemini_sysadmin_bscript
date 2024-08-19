#!/bin/bash

# Function to check disk space
check_disk_space() {
    local threshold=$1
    local usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

    if [ "$usage" -ge "$threshold" ]; then
        echo "Disk usage is at $usage%, which is above the threshold of $threshold%."
        # Send an email alert (this requires a working mail setup)
        echo "Disk usage on $(hostname) is at $usage%, exceeding the threshold of $threshold%." | mail -s "Disk Space Alert" lawalolanrewaju85@gmail.com
    else
        echo "Disk usage is at $usage%, below the threshold of $threshold%."
    fi
}

# Main script logic
if [ $# -ne 1 ]; then
    echo "Usage: $0 threshold"
    exit 1
fi

check_disk_space "$1"

#./check_disk_space.sh 80    # Check if disk usage exceeds 80%

