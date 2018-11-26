#!/bin/sh

set -e

if [ "$1" = 'mysql-backup-all' ]; then

    for DB in (mysql -h "${MYSQL_HOST}" -u ${MYSQL_USER} -p ${MYSQL_PASS} -e "SHOW DATABASES;"); do
	echo "backup ${DB}"
    done
fi

