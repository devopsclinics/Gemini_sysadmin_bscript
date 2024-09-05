# !/bin/bash
# Description: Log monitoring script to monitor specified log files for defined patterns

# Function to monitor a log file for a specified pattern
monitor_log() {
    local logfile=$1
    local pattern=$2

    echo "Monitoring '$logfile' for pattern '$pattern'..."

    # Follow the log file in real-time and search for the pattern
    tail -F "$logfile" | while read line; do
        if [[ $line =~ $pattern ]]; then
            
            echo "Pattern found: $line"
            
        fi
    done
}

# Main script logic
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <logfile> <pattern>"
    echo "Example: $0 /var/log/syslog ERROR"
    exit 1
fi

# Capture user input
logfile=$1
pattern=$2

# Call the monitor_log function with the provided arguments
monitor_log "$logfile" "$pattern"

# As an example to monitor ERROR log, run
./log_monitor.sh /var/log/syslog ERROR