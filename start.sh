#!/bin/bash

if [ -z "$ALPINEPROJECT_ENVIRONMENT" ]; then
   echo "ALPINEPROJECT_ENVIRONMENT not set, assuming Development"
   ALPINEPROJECT_ENVIRONMENT="Development"
fi

# Load the crontab file based on the environment
CRON_FILE="crontab.$ALPINEPROJECT_ENVIRONMENT"

echo "Loading crontab file: $CRON_FILE"

# Load the crontab file
crontab $CRON_FILE

# Start cron
echo "Starting cron..."
crond -f
