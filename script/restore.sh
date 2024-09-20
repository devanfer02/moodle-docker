#!/bin/bash

# run these scripts from root project

check=$(docker image ls | grep alpine)

if [ ! -z "$check" ]; then 
    echo "Minimal alpine image is not installed yet"
    echo "Building minimal alpine image from docker/custom/alpine"
    docker build -t minimal-alpine docker/custom/alpine  
fi

echo "Minimal Alpine is already installed, going through the restore process"
echo "---------------------------------------------------------------------------------------------------------------------------"

docker load -i backup-moodle-moodle-1.tar
docker load -i backup-moodle-mariadb-1.tar

docker volume create moodle_mariadb_data
docker volume create moodle_moodle_data
docker volume create moodle_moodledata_data

docker run --rm -v moodle_mariadb_data:/bitnami/mariadb -v /tmp:/backup minimal-alpine tar -xvzf /backup/mysql-backup.tar.gz -C /

docker run --rm -v moodle_moodle_data:/bitnami/moodle -v /tmp:/backup minimal-alpine tar -xvzf /backup/moodle-backup.tar.gz -C /

docker run --rm -v moodle_moodledata_data:/bitnami/moodledata -v /tmp:/backup minimal-alpine tar -xvzf /backup/moodle-data-backup.tar.gz -C /