FROM google/cloud-sdk:511.0.0-alpine

COPY entrypoint.sh /

# hadolint ignore=DL3013,DL3018
RUN apk add --no-cache aws-cli mysql-client rsync && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

#checkov:skip=CKV_DOCKER_2:We don't need Docker HEALTHCHECK in Kubernetes

USER cloudsdk

ENTRYPOINT ["/entrypoint.sh"]
