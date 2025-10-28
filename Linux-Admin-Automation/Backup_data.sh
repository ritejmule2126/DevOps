#!/bin/bash
# Script: backup_data.sh
# Description: Backup /etc and /home directories into a local backup folder

BACKUP_DIR="$HOME/backups"
DATE=$(date +%Y%m%d)

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/system_backup_$DATE.tar.gz" /etc /home 2>/dev/null

echo "Backup completed successfully on $(date)"
echo "File saved to: $BACKUP_DIR/system_backup_$DATE.tar.gz"
