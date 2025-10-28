#!/bin/bash
# Script: cleanup_logs.sh
# Description: Delete log files older than 7 days from /var/log

LOG_DIR="/var/log"
DAYS=7

echo "Cleaning up old logs in $LOG_DIR older than $DAYS days..."

find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \; 2>/dev/null

echo "Log cleanup completed on $(date)"
