What?
====

This image will mount a bucket and then starts an nginx server pointing to the contents of the bucket

Usage
====

Use from Kubernetes or Docker

In docker it is required to provide the '--privileged' flag as it requires to enable the s2fs module

Sample:
'''
docker run --privileged -e AWS_ACCESS_KEY=XXXXXXXXXXXXXXXX -e AWS_SECRET_KEY=YYYYYYYYYYYYYYYYYYYYYYYY -e BUCKET_NAME=bucket
'''

Environment Variables
----

AWS_ACCESS_KEY Amazon Access Key
AWS_SECRET_KEY Amazon Secret Key
BUCKET_NAME    Bucket name to mount
