#!/bin/sh

echo "Starting Backups: " `date`

sed -i -e "s@AWS_ACCESS_KEY@${AWS_ACCESS_KEY}@" -e "s@AWS_SECRET_KEY@${AWS_SECRET_KEY}@" \
	/.s3cfg

cat > /root/.pgpass <<EOF
*:*:*:*:${POSTGRES_DBA_PW}
EOF

chmod 600 /.s3cfg /root/.pgpass

s3cmd mb s3://${S3_BUCKET}

DATE=`date +%Y%m%d%H%M`
echo ${BACKUP_DBS} | tr ',' ' ' | while read database; do
	backup=${database}-${DATE}.sql.bz2
	pg_dump -h ${DB_PORT_5432_TCP_ADDR} -U postgres ${database} | bzip2 -9c - > ${database}-${DATE}.sql.bz2
	s3cmd --no-progress put ${backup} s3://${S3_BUCKET}
	rm -f ${backup}
done

echo "Done Backups: " `date`
