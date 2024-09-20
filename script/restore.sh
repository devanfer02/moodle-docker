#!/bin/bash

docker load -i backup-moodle-moodle-1.tar
docker load -i backup-moodle-mariadb-1.tar

docker volume create moodle_mariadb_data
docker volume create moodle_moodle_data
docker volume create moodle_moodledata_data

docker run --rm -v moodle_mariadb_data:/bitnami/mariadb -v /tmp:/backup ubuntu tar -xvzf /backup/mysql-backup.tar.gz -C /

docker run --rm -v moodle_moodle_data:/bitnami/moodle -v /tmp:/backup ubuntu tar -xvzf /backup/moodle-backup.tar.gz -C /

docker run --rm -v moodle_moodledata_data:/bitnami/moodledata -v /tmp:/backup ubuntu tar -xvzf /backup/moodle-data-backup.tar.gz -C /