#!/bin/bash

# run these scripts from root project

check=$(docker image ls | grep alpine)

if [ ! -z "$check" ]; then 
    echo "Minimal alpine image is not installed yet"
    echo "Building minimal alpine image from docker/custom/alpine"
    docker build -t minimal-alpine docker/custom/alpine  
fi

echo "Minimal Alpine is already installed, going through the backup process"
echo "---------------------------------------------------------------------------------------------------------------------------"

echo "Creating mariadb moodle backup..."
docker run --rm -v moodledb_data:/bitnami/mariadb -v ./backup:/backup minimal-alpine tar -czvf /backup/mysql-backup.tar.gz /bitnami/mariadb
echo "Backup mariadb done"
echo "---------------------------------------------------------------------------------------------------------------------------"

echo "Creating moodle backup..."
docker run --rm -v moodle_data:/bitnami/moodle -v ./backup:/backup minimal-alpine tar -czvf /backup/moodle-backup.tar.gz /bitnami/moodle
echo "Backup moodle done"
echo "---------------------------------------------------------------------------------------------------------------------------"

echo "Creating moodledata backup..."
docker run --rm -v moodledata_data:/bitnami/moodledata -v ./backup:/backup minimal-alpine tar -czvf /backup/moodle-data-backup.tar.gz /bitnami/moodledata
echo "Backup moodledata done"
echo "---------------------------------------------------------------------------------------------------------------------------"
