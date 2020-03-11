#!/bin/sh

CREDENTIALS_PATH=/root/.s3fs

echo $AWS_ACCESS_KEY:$AWS_SECRET_KEY > $CREDENTIALS_PATH
chmod 600 $CREDENTIALS_PATH

s3fs $BUCKET_NAME /var/www -o nonempty -o passwd_file=$CREDENTIALS_PATH -o use_cache=/tmp/.s3fs-$BUCKET_NAME -o umask=0000 -o uid=`id -u nginx` -o allow_other

nginx -g 'daemon off;'
