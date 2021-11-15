# see https://hub.docker.com/r/hashicorp/packer/tags for all available tags
FROM hashicorp/packer:light@sha256:f795aace438ef92e738228c21d5ceb7d5dd73ceb7e0b1efab5b0e90cbc4d4dcd

RUN apk add --update python3 py-pip openssl ca-certificates \
    && apk --update add python3-dev libffi-dev openssl-dev musl-dev gcc \
    && pip install --upgrade pip cffi \
    && pip install ansible

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
