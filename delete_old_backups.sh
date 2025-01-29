#!/bin/bash

# Define the backup directory
BACKUP_DIR="/backup"

# Define the current date (as YYYYMMDD)
CURRENT_DATE=$(date +%Y%m%d)
CURRENT_EPOCH=$(date -d "$CURRENT_DATE" +%s)
THREE_DAYS_AGO=$((CURRENT_EPOCH - 3 * 86400))   # 3 days ago in seconds

# Loop through all files in the backup directory
for file in "$BACKUP_DIR"/*.sqlite3; do
    # Extract the date from the filename (db-YYYYMMDD-HHMM.sqlite3)
    filename=$(basename "$file")
    backup_date=$(echo "$filename" | sed -E 's/db-([0-9]{8})-.*/\1/')

    # Convert backup date to epoch seconds for comparison
    backup_epoch=$(date -d "$backup_date" +%s)

    if [ "$backup_epoch" -gt "$THREE_DAYS_AGO" ]; then
        echo "Keep the last 3 days' files: $file"
    elif [ ${backup_date:6:2} = "01" ]; then
        echo "Keep 1st of month $file"
    else
        rm $file
        echo "Deleted file: $file"
    fi
done

