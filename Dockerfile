FROM google/cloud-sdk:319.0.0-alpine

ARG MYSQL_CLIENT_VERSION=10.4.15-r0
ARG RSYNC_VERSION=3.1.3-r2

COPY entrypoint.sh /

RUN apk add --no-cache mysql-client=$MYSQL_CLIENT_VERSION rsync=${RSYNC_VERSION} && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
