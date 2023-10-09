FROM google/cloud-sdk:449.0.0-alpine

COPY entrypoint.sh /

# hadolint ignore=DL3013,DL3018
RUN apk add --no-cache mysql-client py3-pip rsync && \
    pip3 install --no-cache-dir awscli && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

USER cloudsdk

ENTRYPOINT ["/entrypoint.sh"]
