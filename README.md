What?
====

This image will mount a bucket and then starts an nginx server pointing to the contents of the bucket

Usage
====

Use from Kubernetes or Docker

Docker
----

In docker it is required to provide the `--privileged` flag as it requires to enable the s3fs module

Docker Sample:

    docker run --privileged -e AWS_ACCESS_KEY=XXXXXXXXXXXXXXXX -e AWS_SECRET_KEY=YYYYYYYYYYYYYYYYYYYYYYYY -e BUCKET_NAME=bucket
    
Kubernetes
----

It is required to provide the `securityContext/privileged` option set to true to allow the fuse module to load

Kubernetes Yaml Sample:

    ...
    ...
    ...
    spec:
      containers:
      - image: kasthor/nginx-s3fs:latest
        name: nginx-s3fs
        securityContext:
          privileged: true
        env:
        - name: AWS_SECRET_KEY
          value: YYYYYYYYYYYYYYYYYYYYYYYYY
        - name: AWS_ACCESS_KEY
          value: XXXXXXXXXXXXXXXX
        - name: BUCKET_NAME
          value: bucket



Environment Variables
----

* `AWS_ACCESS_KEY` Amazon Access Key
* `AWS_SECRET_KEY` Amazon Secret Key
* `BUCKET_NAME`    Bucket name to mount
