FROM google/cloud-sdk:319.0.0-alpine

ARG MYSQL_CLIENT_VERSION=10.5.6-r0
ARG RSYNC_VERSION=3.2.3-r0

COPY entrypoint.sh /

RUN apk add --no-cache mysql-client=$MYSQL_CLIENT_VERSION rsync=${RSYNC_VERSION} && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
