#!/bin/bash

SOURCE="$HOME/cron-backup-project/data"
DEST="$HOME/cron-backup-project/backup"
LOG="$HOME/cron-backup-project/logs/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$DEST"

tar -czf "$DEST/backup-$DATE.tar.gz" "$SOURCE"

if [ $? -eq 0 ]; then
    echo "$(date): Backup successful" >> "$LOG"
else
    echo "$(date): Backup failed" >> "$LOG"
fi