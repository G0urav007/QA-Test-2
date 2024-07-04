#!/bin/bash

# Check if the URL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 http://your-application-url"
    exit 1
fi

URL="$1"
LOG_FILE="health_check_$(date +'%Y%m%d_%H%M%S').log"

# Function to check application health
check_health() {
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    if [ "$HTTP_STATUS" -eq 200 ]; then
        echo "$(date): $URL is UP (HTTP Status: $HTTP_STATUS)" | tee -a "$LOG_FILE"
        return 0
    else
        echo "$(date): $URL is DOWN (HTTP Status: $HTTP_STATUS)" | tee -a "$LOG_FILE"
        return 1
    fi
}

# Perform the health check
check_health

# Exit with the appropriate status code
exit $?
