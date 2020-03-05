FROM alpine:edge

RUN apk add nginx
RUN apk add s3fs-fuse --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN mkdir /run/nginx

COPY entrypoint.sh /
COPY default.conf /etc/nginx/conf.d
RUN chmod a+x /entrypoint.sh
WORKDIR /

EXPOSE 80

STOPSIGNAL SIGTERM

ENTRYPOINT ["./entrypoint.sh"]
