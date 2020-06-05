FROM google/cloud-sdk:250.0.0-alpine

COPY entrypoint.sh /

RUN apk add mysql-client rsync && \
    chmod +x /entrypoint.sh
    
    
# install s3 tools
RUN apk add python py-pip groff && \
    pip install awscli && \
    apk del py-pip

ENTRYPOINT ["/entrypoint.sh"]
