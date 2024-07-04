#!/bin/bash

# Check if the log file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/logfile"
    exit 1
fi

LOGFILE="$1"

# Check if the log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Log file $LOGFILE not found!"
    exit 1
fi

# Report file
REPORT_FILE="log_report_$(date +'%Y%m%d_%H%M%S').txt"

# Number of 404 errors
echo "Number of 404 errors:" >> "$REPORT_FILE"
grep " 404 " "$LOGFILE" | wc -l >> "$REPORT_FILE"

# Most requested pages
echo -e "\nMost requested pages:" >> "$REPORT_FILE"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10 >> "$REPORT_FILE"

# IP addresses with the most requests
echo -e "\nIP addresses with the most requests:" >> "$REPORT_FILE"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10 >> "$REPORT_FILE"

# Top user agents
echo -e "\nTop User Agents:" >> "$REPORT_FILE"
awk -F\" '{print $6}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10 >> "$REPORT_FILE"

# Print the report
cat "$REPORT_FILE"

echo "Report generated: $REPORT_FILE"

exit 0
