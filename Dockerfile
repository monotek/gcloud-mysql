FROM google/cloud-sdk:344.0.0-alpine

ARG MYSQL_CLIENT_VERSION=10.5.9-r0
ARG RSYNC_VERSION=3.2.3-r1

COPY entrypoint.sh /

RUN apk add --no-cache mysql-client=$MYSQL_CLIENT_VERSION rsync=${RSYNC_VERSION} && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

USER cloudsdk

ENTRYPOINT ["/entrypoint.sh"]
