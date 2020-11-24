FROM google/cloud-sdk:319.0.0-alpine

COPY entrypoint.sh /

RUN apk add --update --no-cache mysql-client rsync && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
