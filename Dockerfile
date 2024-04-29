FROM google/cloud-sdk:473.0.0-alpine

COPY entrypoint.sh /

# hadolint ignore=DL3013,DL3018
RUN apk add --no-cache aws-cli mysql-client rsync && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

USER cloudsdk

ENTRYPOINT ["/entrypoint.sh"]
