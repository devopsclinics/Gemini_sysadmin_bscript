#!/bin/bash

# Function to monitor a log file for a specific pattern
monitor_log() {
    local logfile=$1
    local pattern=$2

    echo "Monitoring $logfile for pattern '$pattern'..."
    
    # Use tail to monitor the file in real-time and grep to filter lines matching the pattern
    tail -f "$logfile" | grep --line-buffered "$pattern"
}

# Main script logic
if [ $# -ne 2 ]; then
    echo "Usage: $0 logfile pattern"
    exit 1
fi

#monitor_log "$1" "$2"

##!/bin/bash
## Description: Log monitoring script
#
#monitor_log() {
#    local logfile=$1
#    local pattern=$2
#
#    tail -F $logfile | while read line; do
#        if [[ $line =~ $pattern ]]; then
#            echo "Pattern found: $line"
#        fi
#    done
#}
#
## Call the function
#monitor_log "/var/log/syslog" "ERROR"

#./log_monitor.sh /var/log/syslog "ERROR"    # Monitor /var/log/syslog for the word "ERROR"


