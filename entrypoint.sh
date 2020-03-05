#!/bin/sh

CREDENTIALS_PATH=/root/.s3fs

echo $AWS_ACCESS_KEY:$AWS_SECRET_KEY > $CREDENTIALS_PATH
chmod 600 $CREDENTIALS_PATH

s3fs $BUCKET_NAME /var/www -o nonempty -o passwd_file=$CREDENTIALS_PATH

nginx -g 'daemon off;'
