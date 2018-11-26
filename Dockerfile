FROM google/cloud-sdk:alpine

COPY entrypoint.sh /

RUN apk add mysql-client && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
