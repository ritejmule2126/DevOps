#!/bin/bash
# Script: monitor_disk.sh
# Description: Check disk usage and alert if usage exceeds 80%

THRESHOLD=80

df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do
  usage=$(echo $output | awk '{print $1}' | sed 's/%//')
  partition=$(echo $output | awk '{print $2}')

  if [ $usage -ge $THRESHOLD ]; then
    echo "Warning: Disk usage on $partition is at ${usage}% on $(date)" \
    | mail -s "Disk Space Alert" root@localhost
  fi
done
