FROM google/cloud-sdk:alpine

COPY entrypoint.sh /

RUN apk add mysql-client rsync && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
