#!/bin/bash
# Variables
BACKUP_DIR="/srv/Millennium/ContractSystem/Backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/contracts_db_backup_$TIMESTAMP.sql"
ZIP_FILE="$BACKUP_FILE.gz"
DOCKER_BIN="/usr/bin/docker"
DOCKER_CONTAINER="django_contracts_db"  
MYSQL_USER="ictco"
MYSQL_PASSWORD="passw0rd"
MYSQL_DB="contracts_db"
# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Create a backup inside the container and copy it out
$DOCKER_BIN exec $DOCKER_CONTAINER mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB > "$BACKUP_FILE"

# Check if the dump was successful
if [ $? -eq 0 ]; then
    # Compress the backup file
    gzip "$BACKUP_FILE"
    echo "Backup created and compressed successfully: $ZIP_FILE"
else
    echo "Error: Failed to create database backup!" >&2
    exit 1
fi

# Remove backups older than 7 days
find "$BACKUP_DIR" -type f -name "contracts_db_backup_*.sql.gz" -mtime +7 -exec rm -f {} \;

echo "Old backups (older than 7 days) cleaned up."
