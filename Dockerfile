FROM google/cloud-sdk:392.0.0-alpine

COPY entrypoint.sh /

# hadolint ignore=DL3018
RUN apk add --no-cache mysql-client rsync && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

USER cloudsdk

ENTRYPOINT ["/entrypoint.sh"]
