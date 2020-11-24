#!/bin/sh

set -e

TIMESTAMP="$(date +'%Y%m%d%H%M')"
BACKUP_DIR="/tmp"

if [ "$1" = 'mysql-backup-all' ]; then
    for DB in $(mysql -h "${MYSQL_HOST}" -u "${MYSQL_USER}" -p "${MYSQL_PASS}" -e "SHOW DATABASES;"| grep -E -v "(|)"); do
	echo "backup ${DB}"
        mysqldump --opt -h "${MYSQL_HOST}" -u "${MYSQL_USER}" -p "${MYSQL_PASS}" "${DB}" | gzip > /"${BACKUP_DIR}/${TIMESTAMP}_${DB}".sql.gz
    done
else
    ${1}
fi
