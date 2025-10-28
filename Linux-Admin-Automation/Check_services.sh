#!/bin/bash
# Script: check_services.sh
# Description: Check and restart critical services if stopped

SERVICES=("ssh" "cron" "nginx")

for service in "${SERVICES[@]}"
do
  if systemctl is-active --quiet $service; then
    echo "$service is running"
  else
    echo "$service is not running! Restarting..."
    if sudo systemctl restart $service 2>/dev/null; then
      echo "$service restarted successfully at $(date)"
    else
      echo "⚠️ Failed to restart $service — service not found or error occurred."
    fi
  fi
done
